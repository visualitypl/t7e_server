class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :set_projects

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_projects
    return [] unless current_user

    @current_user_projects = (current_user.id == 1) ? Project.all : current_user.projects
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
