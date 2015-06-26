class TranslationRevisionsController < ApplicationController
  before_action :set_translation_revision, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @translation_revisions = TranslationRevision.all
    respond_with(@translation_revisions)
  end

  def show
    respond_with(@translation_revision)
  end

  def new
    @translation_revision = TranslationRevision.new
    respond_with(@translation_revision)
  end

  def edit
  end

  def create
    @translation_revision = TranslationRevision.new(translation_revision_params)
    @translation_revision.save
    respond_with(@translation_revision)
  end

  def update
    @translation_revision.update(translation_revision_params)
    respond_with(@translation_revision)
  end

  def destroy
    @translation_revision.destroy
    respond_with(@translation_revision)
  end

  private

  def set_translation_revision
    @translation_revision = TranslationRevision.find(params[:id])
  end

  def translation_revision_params
    params.require(:translation_revision).permit(:translation_id, :user_id, :value)
  end
end
