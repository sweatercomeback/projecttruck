module VehicleHelper
    def bool_image(test)
        if (test)
            return "<img src=\"/images/check.gif\" alt=\"Yes\">"
        else
            return "<img src=\"/images/x.gif\" alt=\"No\">"
        end
    end
end
