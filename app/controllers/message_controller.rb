class MessageController < ApplicationController
layout 'standard'
before_filter :login_required

  def list
    @messages = Message.find(:all, :conditions => ['user_id = ?', session[:user].id])
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def send_message
    if request.post?
      params[:message][:user_id] = User.find(:first, :conditions => ['login = ?', params[:to_login]]).id
      @message = Message.new(params[:message])
      @message.from_user_id = session[:user].id
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
