module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def current_creator
        @current_creator ||= Creator.find_by_id(session[:creator_id])
    end

    def logged_in_user?
        !!session[:user_id]
    end

    def logged_in_creator?
        !!session[:creator_id]
    end

    def check_unauthenticated_redirect_needed
        if !logged_in_user? && !logged_in_creator?
            redirect_to '/'
        end
    end

    def authenticated_user_or_creator?
        logged_in_account = false
        if !logged_in_user? || !logged_in_creator?
            logged_in_account = true
        end
        logged_in_account
    end
    
    def for_creator_url?
        current_url_for_creator = false
        if request.original_url.include?('landingcreator')
            current_url_for_creator = true
        end
        current_url_for_creator
    end

    def nested_album_url?
        url_for_nested_album = false
        if request.original_url.include?('/album')
            url_for_nested_album = true
        end
        url_for_nested_album
    end
end
