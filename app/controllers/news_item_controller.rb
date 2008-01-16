class NewsItemController < ApplicationController
layout 'nustandard'

def list
    @news_items = NewsItem.find(:all)
end

def show
    @news_item = NewsItem.find(params[:id])
end

def new
    @news_item = NewsItem.new
    @news_item.active = true
end

def create
    @news_item= NewsItem.new(params[:news_item])
    if @news_item.save
        redirect_to :action => 'list'
    else
        render :action => 'new'
    end
end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def update
    @news_item = NewsItem.find(params[:id])
    if @news_item.update_attributes(params[:news_item])
        redirect_to :action => 'show', :id => @news_item
    else
        render :action => 'edit'    
    end
  end
end
