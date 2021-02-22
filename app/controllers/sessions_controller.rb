class SessionsController < ApplicationController

    def landing
        # if they're logged in as a user don't take them to the 
        # user landing page, take them to the logged in user home page
        if logged_in_user?
            redirect_to home_path
        elsif logged_in_creator?
            # if they click on this link but they're logged in as a creator, then 
            # take them back to their own home page.
            redirect_to home_creator_path
        end
    end

    def landingcreator
        # if they're logged in as a creator don't take them to the 
        # creator landing page, take them to the logged in creator home page
        if logged_in_creator?
            redirect_to home_creator_path
        elsif logged_in_user?
            # if they click on this link but they're logged in as a user, then 
            # take them back to their own home page.
            redirect_to home_path
        end
    end

    # this creates a new user that we can use to login with
    # and then we use that user to login using the 'create' path below.
    def new
        @user = User.new
        render :login
    end

    def create
         # clear the session if they're logged in as a creator and they try to sign in as a user.
         session.clear

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
        # clear the session if they're logged in as a user and they try to sign in as a creator.
        session.clear

        
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

    # google
    def googlecreate
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to home_path
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