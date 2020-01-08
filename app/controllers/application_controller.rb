class ApplicationController < ActionController::Base
    def hello
        render html: "application_controller.rb"
    end

    protect_from_forgery with: :exception
    include SessionsHelper
end
