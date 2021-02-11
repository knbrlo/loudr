class SessionsController < ApplicationController

    def home
    end

    def new
        @user = User.new
        render :login
    end

    def create
    end

    def newcreator
        @creator = Creator.new
        render :logincreator
    end

    def createcreator
    end


    # logout - user
    # todo - these are setup as different paths for user and creator so we can take different actions for each.
    def destroy
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