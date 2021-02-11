class SessionsController < ApplicationController

    def home
    end

    def create
    end

    def new
    end

    # logout - user
    # todo - these are setup as different paths for user and creator so we can take different actions for each.
    def destroyuser
        session.clear
        redirect_to '/'
    end


    # logout - creator
    # todo - these are setup as different paths for user and creator so we can take different actions for each.
    def destroycreator
        session.clear
        redirect_to '/'
    end

end