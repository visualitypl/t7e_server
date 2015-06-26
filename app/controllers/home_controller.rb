class HomeController < ApplicationController
  def index
    @projects = @current_user_projects
  end
end