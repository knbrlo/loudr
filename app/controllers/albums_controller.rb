class AlbumsController < ApplicationController
    before_action :check_authenticated, only: [:index, :show]

    def index
        # must be logged in as a user or as a creator to see all albums
        if params[:category].present?
            @selected_category = params[:category].downcase!
            if @selected_category == "edm"
                @albums = Album.edm_music   
            end
        else
            # todo - change to released albums not just all albums and also set a max.
            @albums = Album.all
        end
    end

    def new
        # must be logged in as a creator to see form to make a new album
        if logged_in_creator?
            @album = Album.new
        else
            redirect_to '/'
        end
    end

    def create
        # must be logged in as a creator to post to make a new album
        if logged_in_creator?

            # make the new album based on the current creator
            @album = current_creator.albums.build(album_params)

            # if the album is successfully saved then proceed and redirect to the next page
            if @album.save
                
                # send the user to the album detail page where they can add songs
                redirect_to album_path(@album)
            else
                # send the user back to the new album page
                render :new
            end
        else
            redirect_to '/'
        end
    end

    def show
        # must be logged in to see album show page
        @album = Album.find_by_id(params[:id])
    end
    

    private
    
    def album_params
        params.require(:album).permit(:name, :category, :release_date, :released)
    end
end
