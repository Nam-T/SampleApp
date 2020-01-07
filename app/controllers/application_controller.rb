class ApplicationController < ActionController::Base
    def hello
        render html: "application_controller.rb"
    end
end
