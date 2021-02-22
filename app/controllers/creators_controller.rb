class CreatorsController < ApplicationController

    def new
        # make a new creator user that we can access within our form.
        @creator = Creator.new
    end

    def create

        # create the creator from the params from the form.
        @creator = Creator.new(creator_params)

        # if the creator is successfully saved then set the sessions id
        # then redirect to the new page.
        if @creator.save

            # save the creator id in the session so it can be accessed anywhere it's needed.
            session[:creator_id] = @creator.id

            # send the user to the path for our creator home page
            redirect_to home_creator_path
        else
            # send the user back to thew new page to create a new creator
            # also this helps us display flash messages and makes so we don't
            # keep any saved information around such as username / email / password
            render :new
        end
    end

    def home

        # make sure the creator is logged in to see the home-creator path
        if logged_in_creator?

            # make an empty array we can check for values
            # and iterate over if there are values in the view.
            @all_albums = []

            # if there are albums in available them assign them to the 
            # array we created above
            if albums = Album.where(creator_id: session[:creator_id])
                @all_albums = albums
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
