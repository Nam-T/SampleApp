class ApplicationController < ActionController::Base
    def hello
        render html: "application_controller.rb"
    end

    protect_from_forgery with: :exception
    include SessionsHelper

    private

        # Confirms a logged-in user.
        def logged_in_user
            unless logged_in?
                store_location
                flash[:danger] = "Please log in."
                redirect_to login_url
             end
         end
end
