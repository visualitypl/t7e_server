class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  respond_to :html, :js


  def show

  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def create
    @project = Project.new(project_params)
    @project.project_languages.build(language_id: @project.default_language_id)
    @project.save
    respond_with @translation do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :default_language_id, :description)
  end
end