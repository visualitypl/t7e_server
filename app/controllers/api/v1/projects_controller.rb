class Api::V1::ProjectsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, :only => [:show, :update]
  before_filter :ensure_project_exists, :only => [:show, :update]

  def show
    action = Action::Api::V1::ShowYaml.new(
      show_params.merge(:project => current_project))

    if action.execute
      render :json => {}
    else
      render :json => {}, :status => 422
    end
  end

  def update
    action = Action::Api::V1::UpdateYaml.new(
      update_params.merge(:project => current_project))

    if action.execute
      render :json => {}
    else
      render :json => {}, :status => 422
    end
  end

  private

  def update_params
    params.permit(:yaml, :language)
  end

  def show_params
    params.permit(:yaml, :language)
  end
end