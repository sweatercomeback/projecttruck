class UsersController < ApplicationController
  layout 'standard'
  skip_before_filter :login_required
    
  #current logged in user
    def index
      @makes = {}
      Make.find(:all).collect { |m| @makes[m.name] = m.id }
      @makes.store("Any Make",nil)
      if logged_in?
        @user = User.find(session[:user_id])
      end
    end


  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      #activate the user--comment this line out if using the activation workflow
      @user.activate
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_user = params[:id].blank? ? :false : User.find_by_activation_code(params[:id])
    breakpoint
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

end
