class ApplicationController < ActionController::Base

    def get_user_session
        if cookies[:user_session].blank?
            cookies[:user_session] =  Random.uuid()
        end
        return cookies[:user_session]
    end


end
