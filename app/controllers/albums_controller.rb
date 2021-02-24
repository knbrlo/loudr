class AlbumsController < ApplicationController
    before_action :check_authenticated, only: [:index, :show]

    def index
        if params[:category].present?
            @selected_category = params[:category].downcase!
            if @selected_category == "edm"
                @albums = Album.edm_music   
            end
        else
            @albums = Album.all
        end
    end

    def new
        if logged_in_creator?
            @album = Album.new
        else
            redirect_to '/'
        end
    end

    def create
        if logged_in_creator?
            @album = current_creator.albums.build(album_params)
            if @album.save
                redirect_to album_path(@album)
            else
                render :new
            end
        else
            redirect_to '/'
        end
    end

    def show
        @album = Album.find_by_id(params[:id])
    end
    

    private
    
    def album_params
        params.require(:album).permit(:name, :category, :release_date, :released)
    end
end
