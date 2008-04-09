class ModelsController < ApplicationController

  def index
    models = Model.find(:all, :conditions => ['parent_id = ?', params[:make_id]],:order => "name")
    
    respond_to do |format|
      format.html { redirect_to(trucks_url) }
      format.js {
        select_html = "<select id='model_id' name='truck[model_id]'>"
        models.each do |m|
          select_html += "<option value='#{m.id}'>#{m.name}&nbsp;</option>"
        end
        select_html += "</select>"
        render :text => select_html
      }
      format.xml  { render :xml => models.to_xml }
    end  

  end
end