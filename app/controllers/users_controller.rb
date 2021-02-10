class UsersController < ApplicationController

    # displaying the sign up form
    def new
        # make a new user that we can access within our form
        @user = User.new
    end

end
