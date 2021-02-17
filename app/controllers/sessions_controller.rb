class SessionsController < ApplicationController

    def home
    end

    # this creates a new user that we can use to login with
    # and then we use that user to login using the 'create' path below.
    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        
        # check if the user exists and if we can login
        if @user && @user.authenticate(params[:user][:password])

            # set the session user_id
            session[:user_id] = @user.id

            # send the user to their home page
            redirect_to home_path
        else
            # if the user wasn't found / or we're unable to login
            # then display a generic error, we don't want to tell them
            # if the user exists if this is a malicious attempt.
            flash[:error] = "Unable to login, please check your username or passsword"

            # we redirect so that nothing is saved when we display errors.
            redirect_to '/login'
        end
    end

    def newcreator
        @creator = Creator.new
        render :logincreator
    end

    def createcreator
        @creator = Creator.find_by(username: params[:creator][:username])
        
        # check if the creator exists and if we can login
        if @creator && @creator.authenticate(params[:creator][:password])

            # set the session creator_id
            session[:creator_id] = @creator.id

            # send the creator to their home page
            redirect_to home_creator_path
        else
            # if the creator wasn't found / or we're unable to login
            # then display a generic error, we don't want to tell them
            # if the creator exists if this is a malicious attempt.
            flash[:error] = "Unable to login, please check your username or passsword"

            # we redirect so that nothing is saved when we display errors.
            redirect_to '/login-creator'
        end
    end

    # facebook
    def fbcreate
        puts 'LOG 1 - FB CREATE'
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.username = auth['info']['name']
          u.email = auth['info']['email']
         # u.image = auth['info']['image']
        end
    
        session[:user_id] = @user.id
    
        render '/home'
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

    private

    def auth
        request.env['omniauth.auth']
    end

end