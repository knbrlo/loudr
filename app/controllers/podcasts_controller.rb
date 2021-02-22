class PodcastsController < ApplicationController

    before_action :check_authenticated, only: [:index, :show]

    def index
    end

    def show
    end
    
end
