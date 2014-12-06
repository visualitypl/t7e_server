class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @languages = Language.all
    respond_with(@languages)
  end

  def show
    respond_with(@language)
  end

  def new
    @language = Language.new
    respond_with(@language)
  end

  def edit
  end

  def create
    @language = Language.new(language_params)
    @language.save
    respond_with(@language)
  end

  def update
    @language.update(language_params)
    respond_with(@language)
  end

  def destroy
    @language.destroy
    respond_with(@language)
  end

  private
    def set_language
      @language = Language.find(params[:id])
    end

    def language_params
      params.require(:language).permit(:name, :iso_code)
    end
end
