module ApplicationHelper

    def current_user
        # todo - what is meant by memoization here? is that the right term?
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def current_creator
        # todo - what is meant by memoization here? is that the right term?
        @current_creator ||= Creator.find_by_id(session[:creator_id])
    end

    def logged_in_user?
        !!session[:user_id]
    end

    def logged_in_creator?
        !!session[:creator_id]
    end

    def for_creator_url?
        current_url_for_creator = false
        if request.original_url.include?('landingcreator')
            current_url_for_creator = true
        end
        current_url_for_creator
    end
end
