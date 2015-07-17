class Api::V1::ProjectsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, :only => [:show, :update]
  before_filter :ensure_project_exists, :only => [:show, :update]

  def show
    action = Action::Api::V1::ShowYaml.new(
      show_params.merge(:project => current_project))

    yaml_text = action.execute
    if yaml_text
      render :text=> yaml_text
    else
      render :json => {}, :status => 422
    end
  end

  def show_gettext
    action = Action::Api::V1::ShowGettext.new(
        show_gettext_params.merge(:project => current_project))

    gettext_text = action.execute
    if gettext_text
      render :text=> gettext_text
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

  def update_gettext
    action = Action::Api::V1::UpdateGettext.new(
        update_gettext_params.merge(:project => current_project))

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
    params.permit(:language)
  end

  def update_gettext_params
    params.permit(:gettext, :language)
  end

  def show_gettext_params
    params.permit(:language)
  end

end