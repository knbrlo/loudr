class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to home_path
        else
            render :new
        end
    end

    def home
        if logged_in_user?

            @singles = []
            @albums = []
            @podcasts = []

            if singles = Single.where(released: true)
                @singles = singles
            end

            if albums = Album.where(released: true)
                @albums = albums
            end

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
