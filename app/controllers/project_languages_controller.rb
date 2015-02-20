class ProjectLanguagesController < ApplicationController
  before_action :set_project
  before_action :set_project_language, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @project_languages = @project.project_languages.all
    respond_with(@project_languages)
  end

  def show
    respond_with(@project_language)
  end

  def new
    @project_language = @project.project_languages.new
    respond_with(@project_language)
  end

  def create
    @project_language = ProjectLanguage.new(project_language_params.merge(project: @project))
    if @project_language.save
      redirect_to project_project_languages_path(@project)
    else
      respond_with(@project, @project_language)
    end
  end

  def update
    @project_language.update(project_language_params)
    respond_with(@project_language)
  end

  def destroy
    @project_language.destroy
    respond_to do |format|
      format.js {respond_with(@project, @project_language)}
      format.html { respond_with(@project, @project_language)}
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_project_language
      @project_language = ProjectLanguage.find(params[:id])
    end

    def project_language_params
      params.require(:project_language).permit(:language_id)
    end
end
