class CreatorsController < ApplicationController

    def index
    end

    def new
        @creator = Creator.new
    end

    def create
        @creator = Creator.new(creator_params)
        if @creator.save
            session[:creator_id] = @creator.id
            redirect_to home_creator_path
        else
            render :new
        end
    end

    def home
        if logged_in_creator?

            @singles = []
            @albums = []
            @podcasts = []

            if singles = Single.where(creator_id: session[:creator_id])
                @singles = singles
            end

            if albums = Album.where(creator_id: session[:creator_id])
                @albums = albums
            end

            if podcasts = Podcast.where(creator_id: session[:creator_id])
                @podcasts = podcasts
            end
        else
            redirect_to '/'
        end
    end

    private

    def creator_params
        params.require(:creator).permit(:username, :email, :password)
    end
end
