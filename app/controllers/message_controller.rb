class MessageController < ApplicationController
layout 'standard'
before_filter :login_required

  def list
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def send_message
    if request.post?
      @message = Message.new(params[:message])
      @message.from_user_id = session[:user].id
      if @message.save?
        flash[:notice] = "Message sent"
        redirect_to :action => 'list'
      else
        flash[:error] = "There was a problem sending this message"
        redirect_to :action => 'new'
      end
    end
  end

  def delete
  end
end
