class ProjectLanguagesController < ApplicationController
  before_action :set_project_language, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project_languages = ProjectLanguage.all
    respond_with(@project_languages)
  end

  def show
    respond_with(@project_language)
  end

  def new
    @project_language = ProjectLanguage.new
    respond_with(@project_language)
  end

  def edit
  end

  def create
    @project_language = ProjectLanguage.new(project_language_params)
    @project_language.save
    respond_with(@project_language)
  end

  def update
    @project_language.update(project_language_params)
    respond_with(@project_language)
  end

  def destroy
    @project_language.destroy
    respond_with(@project_language)
  end

  private
    def set_project_language
      @project_language = ProjectLanguage.find(params[:id])
    end

    def project_language_params
      params.require(:project_language).permit(:project_id, :language_id)
    end
end
