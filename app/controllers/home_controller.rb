class HomeController < ApplicationController
layout 'home'

    def index
        @news_items = NewsItem.find(:all)
    end
    
    
end
