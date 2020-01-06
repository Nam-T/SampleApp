class UsersController < ApplicationController
  def new  
    render json: User.all
  end
end
