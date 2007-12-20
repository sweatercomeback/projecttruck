class ComingSoonController < ApplicationController

  def index
    if request.post?
        @coming_soon = ComingSoon.new(params[:coming_soon])
        if @coming_soon.save
            flash[:message] = "Thank You."
            redirect_to :action => 'index'
        end
    end
  end
end
