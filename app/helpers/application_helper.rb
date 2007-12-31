# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def getLeftNavLinks
        return NavLinks.find(:all, :conditions => ["(controller = ? or controller is null) and (action = ? or action is null)", controller.controller_name, controller.action_name])
    end
end
