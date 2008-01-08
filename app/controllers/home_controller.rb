class HomeController < ApplicationController
layout 'home'

    after_filter :update_user_activity

    def index
	if session[:user_id].nil?
	    @news_items = NewsItem.find(:all)
	else
	    @news_items = NewsItem.find(:all)
	end
    end
   
    
end
