class ModelsController < ApplicationController

  def index
    models = Model.find(:all, :conditions => ['parent_id = ?', params[:make_id]],:order => "name")
    
    respond_to do |format|
      format.html { redirect_to(trucks_url) }
      format.js {
  
        if (!params[:search].nil? && params[:search] == "1")
          select_html = "<select id='model_id' name='model_id'>"
          select_html += "<option value='-1'>Any Model&nbsp;</option>"
        else
          select_html = "<select id='truck_model_id' name='truck[model_id]'>"
        end
        models.each do |m|
          if !params[:model_id].nil? && !params[:model_id] != "-1"
            select_html += "<option value='#{m.id}' selected='selected'>#{m.name}&nbsp;</option>"
          else
            select_html += "<option value='#{m.id}'>#{m.name}&nbsp;</option>"
          end
          
        end
        select_html += "</select>"
        render :text => select_html
      }
      format.xml  { render :xml => models.to_xml }
    end  

  end
end
