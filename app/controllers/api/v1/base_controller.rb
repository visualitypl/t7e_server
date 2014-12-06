class Api::V1::BaseController < ApplicationController

  protected

  def ensure_project_exists
    head :unauthorized unless current_project
  end

  def current_project
    api_key = ApiKey.active.where(:access_token => token).first

    if api_key
      return api_key.project
    else
      return nil
    end
  end

  def token
    request.filtered_parameters['id']
  end
end