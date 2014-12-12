class TranslationsController < ApplicationController
  before_action :set_translation_entry
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  respond_to :js

  def index
    @translations = @translation_entry.translations.all
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
    @translation.update(translation_params_js)
    render text: @translation.errors.full_messages.join(',')
  end

  def destroy
    @translation.destroy
    respond_with(@translation)
  end

  private
    def set_translation_entry
      @translation_entry = TranslationEntry.find(params[:translation_entry_id])
    end

    def set_translation
      @translation = Translation.find(params[:id])
    end

    def translation_params
      params.require(:translation).permit(:translation_entry_id, :value, :language_id)
    end

  def translation_params_js
    params.permit(:translation_entry_id, :value, :language_id)
  end

end
