class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @translations = Translation.all
    respond_with(@translations)
  end

  def show
    respond_with(@translation)
  end

  def new
    @translation = Translation.new
    respond_with(@translation)
  end

  def edit
  end

  def create
    @translation = Translation.new(translation_params)
    @translation.save
    respond_with(@translation)
  end

  def update
    @translation.update(translation_params)
    respond_with(@translation)
  end

  def destroy
    @translation.destroy
    respond_with(@translation)
  end

  private
    def set_translation
      @translation = Translation.find(params[:id])
    end

    def translation_params
      params.require(:translation).permit(:translation_entry_id, :value, :language_id)
    end
end
