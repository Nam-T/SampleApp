class StaticPagesController < ApplicationController
  def home
    render json: ["Users":{"Name":"vtnam","age":"21"}]
  end

  def help
  end
end
