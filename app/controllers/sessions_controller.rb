class SessionsController < ApplicationController

    def landing
        if logged_in_user?
            redirect_to home_path
        elsif logged_in_creator?
            redirect_to home_creator_path
        end
    end

    def landingcreator
        if logged_in_creator?
            redirect_to home_creator_path
        elsif logged_in_user?
            redirect_to home_path
        end
    end

    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to home_path
        else
            flash[:error] = "Unable to login, please check your username or passsword"
            redirect_to '/login'
        end
    end

    def newcreator
        @creator = Creator.new
        render :logincreator
    end

    def createcreator
        @creator = Creator.find_by(username: params[:creator][:username])
        if @creator && @creator.authenticate(params[:creator][:password])
            session[:creator_id] = @creator.id
            redirect_to home_creator_path
        else
            flash[:error] = "Unable to login, please check your username or passsword"
            redirect_to '/login-creator'
        end
    end

    def googlecreate
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to home_path
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def destroycreator
        session.clear
        redirect_to '/'
    end

    private
    
    def auth
      request.env['omniauth.auth']
    end
end