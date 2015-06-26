class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @languages = Language.all
  end

  def show
  end

  def new
    @language = Language.new
  end

  def edit
  end

  def create
    @language = Language.new(language_params)
    @language.save
  end

  def update
    @language.update(language_params)
  end

  def destroy
    @language.destroy
  end

  private

  def set_language
    @language = Language.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:name, :iso_code)
  end
end
