class Api::V1::ProjectsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, :only => [:show, :update]
  before_filter :ensure_project_exists, :only => [:show, :update]

  def show
    render :json => {}
    # pseudocode
    # action = someactiontofindproperlanguage

    # if action.success
    #   render :json => action.text
    # else
    #   render :json => {'siktir'}
    # end
  end

  def update
    render :json => {}
    # pseudo code
    # action = sarkircreateyaml
    # if action.success
    #   render json => {"ok"}
    # else
    #   render :json => {'siktir'}
    # end
  end
end