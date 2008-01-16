class UserController < ApplicationController
layout 'home'
  
  include GeoKit::Geocoders
  before_filter :login_required, :only=>['welcome', 'change_password', 'hidden']
  after_filter :update_user_activity, :only => :login

  def signup
    @user = User.new(params[:user])
    if request.post?
      geoloc = MultiGeocoder.geocode(params[:loc][:location])
      @user.lat = geoloc.lat
      @user.lng = geoloc.lng
      if @user.save
        session[:user_id] = User.authenticate(@user.login, @user.password)
        flash[:message] = "Signup successful"
        redirect_to :action => "welcome"          
      else
        flash[:warning] = "Signup unsuccessful"
      end
    end
  end

  def login
    if request.post?
      session[:user_id] = User.authenticate(params[:user][:login], params[:user][:password])
      if !session[:user_id].nil?
        flash[:message]  = "Login successful"
        redirect_to :action => "home"
      else
        flash[:error ] = "User name or password invalid.  Try again."
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
  end

  def forgot_password
    if request.post?
      u= User.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:message]  = "A new password has been sent by email."
        redirect_to :action=>'login'
      else
        flash[:warning]  = "Couldn't send password"
      end
    end
  end
  
  def change_password
    @user=User.find(session[:user_id])
    if request.post?
      @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:message]="Password Changed"
      end
    end
  end

  def welcome
      redirect_to :controller => 'vehicle', :action => 'list'
  end
  def hidden
  end
  
  def online
    @users = User.find_recent
  end
  
  def home
    if params[:id].nil? && session[:user_id].nil?
      redirect_to :controller => 'home'
    elsif !params[:id].nil?
      #check to see if a username was passed in or an id
      if params[:id].to_i == 0
        params[:id] = User.find_by_login(params[:id]).id
      end
      @user=User.find(params[:id])
    else
      @user=User.find(session[:user_id])
    end
    
#    rescue ActiveRecord::RecordNotFound
#      redirect_to :controller => 'home'
      
    @top_projects = Project.find_top_by_user_id(@user.id, 5)
    @top_logs = ServiceLog.find_top_by_user_id(@user.id, 5)
    @new_messages = Message.find(:all, :conditions =>{:unread => 1, :user_id => @user.id})
    @news_items = NewsItem.find(:all)
  end
end
