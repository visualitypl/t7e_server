class TranslationEntriesController < ApplicationController
  before_action :set_project
  before_action :set_translation_entry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @translation_entries = @project.translation_entries.where('parent_entry_id IS NULL').order(:key_type => :desc).all
    respond_with(@translation_entries)
  end

  def show
    @translation_entries = @project.translation_entries.where(parent_entry: @translation_entry).order(:key_type => :desc).all
    respond_with(@translation_entry)
  end

  def new
    @translation_entry = TranslationEntry.new
    respond_with(@translation_entry)
  end

  def edit
  end

  def create
    @translation_entry = TranslationEntry.new(translation_entry_params)
    @translation_entry.save
    respond_with(@translation_entry)
  end

  def update
    @translation_entry.update(translation_entry_params)
    respond_with(@translation_entry)
  end

  def destroy
    @translation_entry.destroy
    respond_with(@translation_entry)
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_translation_entry
      @translation_entry = TranslationEntry.find(params[:id])
    end

    def translation_entry_params
      params.require(:translation_entry).permit(:key, :key_type, :parent_entry_id, :path, :project_id)
    end
end
