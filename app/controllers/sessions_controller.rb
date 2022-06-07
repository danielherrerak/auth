class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by({ "email" => params["email"] })
        if @user
            # if @user ["password"] == params["password"]
            if BCrypt::Password.new(@user["password"]) == params["password"]
            #cookies["monster"] = "Me like cookies"
            #cookies["authenticated"] = true
            session["user_id"] = @user["id"]

            flash["notice"] = "Welcome"
            redirect_to "/companies"
            else
            flash["notice"] = "Nope"
            redirect_to "/sessions/new"
            end
        else
            flash["notice"] = "Nope"
            redirect_to "/sessions/new"
        end
    end

    def destroy
        session["session_id"] = nil
        flash["notice"] = "Goodbye"
        redirect_to "/sessions/new"
    end
end
