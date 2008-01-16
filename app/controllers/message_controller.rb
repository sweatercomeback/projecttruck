class MessageController < ApplicationController
layout 'home'
before_filter :login_required

  def list
    @messages = Message.find(:all, :conditions => {:user_id => session[:user_id]})
  end

  def show
    @message = Message.find(params[:id])
    @message.unread = 0
    @message.save
  end

  def new
    @message = Message.new
  end
  


  def send_message
    if request.post?
      toUser = User.find(:first, :conditions => ['login = ?', params[:to_login]])
      if toUser.nil?
        flash[:error] = "Recipient doesn't exist"
        redirect_to :action => 'new'
        return
      end
      params[:message][:user_id] = toUser.id
      if params[:message][:subject].blank?
        params[:message][:subject] = "(no subject)"
      end
      @message = Message.new(params[:message])
      @message.from_user_id = session[:user_id]
      if @message.save
        flash[:notice] = "Message sent"
        redirect_to :action => 'list'
      else
        flash[:error] = "There was a problem sending this message"
        redirect_to :action => 'new'
      end
    else
      redirect_to :action => 'list'
    end
  end

  def delete
    Message.find(params[:id]).destroy
    flash[:notice] = "Message deleted"
    redirect_to :action => 'list'
  end
end
