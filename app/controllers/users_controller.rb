class UsersController < ApplicationController

    # displaying the sign up form
    def new
        # make a new user that we can access within our form
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        # if the user is successfully saved then set the session id
        # then redirect to the new page.
        if @user.save
            
            # save the user id in the session so it can be access anywhere that's needed
            session[:user_id] = @user.id

            # send the user to the path for our primary object 
            redirect_to home_path
        else
            # send the user back to thew new page to create a new user
            render :new
        end
    end

    def home
        # todo - get favorites 

        # make sure the user is logged in to see the home path
        if logged_in_user?

            # make empty arrays we can check for values
            # and iterate over if there are values in the view.
            @singles = []
            @albums = []
            @podcasts = []

            # if there are singles in available then assign  
            # them to the array we created above
            # todo - set a max on this so we don't get too big of a payload.
            if singles = Single.where(released: true)
                @singles = singles
            end

            # if there are albums in available then assign  
            # them to the array we created above
            # todo - set a max on this so we don't get too big of a payload.
            if albums = Album.where(released: true)
                @albums = albums
            end

            # if there are albums in available then assign  
            # them to the array we created above
            # todo - set a max on this so we don't get too big of a payload.
            if podcasts = Podcast.where(released: true)
                @podcasts = podcasts
            end
        else
            redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
