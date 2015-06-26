class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :set_projects

  private

  def set_projects
    return [] unless current_user

    @current_user_projects = (current_user.id == 1) ? Project.all : current_user.projects
  end
end
