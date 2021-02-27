class PodcastsController < ApplicationController

    before_action :check_unauthenticated_redirect_needed, only: [:index, :show]

    def index
    end

    def show
    end  
end
