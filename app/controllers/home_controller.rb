class HomeController < ApplicationController
layout 'home'

    after_filter :update_user_activity

    def index
        @news_items = NewsItem.find(:all)
    end
    
    
end
