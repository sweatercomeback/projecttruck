module UserHelper
    
    def is_owner(user_id)
        if session[:user_id] == user_id
            return true
        else
            return false
        end
    end
    
    
    
end
