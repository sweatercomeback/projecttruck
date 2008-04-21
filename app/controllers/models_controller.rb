class ModelsController < ApplicationController

  def index
    models = Model.find(:all, :conditions => ['parent_id = ?', params[:make_id]],:order => "name")
    
    respond_to do |format|
      format.html { redirect_to(trucks_url) }
      format.js {
  
        select_html = "<select id='truck_model_id' name='truck[model_id]'>"
        if (params[:search].nil? && params[:search] == "1")
          select_html += "<option value='-1'>Any Model&nbsp;</option>"
        end
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
