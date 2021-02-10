class UsersController < ApplicationController

    # displaying the sign up form
    def new
        # make a new user that we can access within our form
        @user = User.new
    end

    def create
        @new_user = User.new(user_params)

        # if the user is successfully saved then set the session id
        # then redirect to the new page.
        if @new_user.save
            
            # save the user id in the session so it can be access anywhere that's needed
            sessions[:user_id] = @new_user.id

            # send the user to the path for our primary object (yet to define yet.)
            
        else
            # send the user back to thew new page to create a new user
            # also this helps us display flash messages and makes so we don't
            # keep any saved information around such as username / email / password
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
