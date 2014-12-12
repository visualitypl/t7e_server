class TranslationEntriesController < ApplicationController
  before_action :set_project
  before_action :set_translation_entry, only: [:show, :edit, :update, :destroy, :show_key]
  before_action :set_parent_blocks

  respond_to :html, :js

  def index
    #TODO: refactor
    @translation_entries = @project.translation_entries.where('parent_entry_id IS NULL').order(:key_type => :desc).all
    #for translations
    @translation_keys = @project.translation_entries
                            .where(parent_entry: @translation_entry).key.includes(:translations).all
    render 'show'
  end

  def show
    #for directory listing
    @translation_entries = @project.translation_entries.where(parent_entry: @translation_entry).order(:key_type => :desc).all
    #for translations
    @translation_keys = @project.translation_entries
                            .where(parent_entry: @translation_entry).key.includes(:translations).all
    respond_with(@translation_entry)
  end

  def show_key
    @translation_keys = [@translation_entry]
    @translation_entry = @translation_entry.parent_entry
    @translation_entries = @project.translation_entries.where(parent_entry: @translation_entry).order(:key_type => :desc).all

    render 'show'
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

    def set_parent_blocks
      max_number_of_nesting = 10
      @parent_blocks = []
      if @translation_entry.present?
        block = @translation_entry.block? ? @translation_entry : @translation_entry.parent_entry
      end
      while !block.nil? && max_number_of_nesting > 0
        @parent_blocks << {block: block, siblings: TranslationEntry.where(parent_entry_id: block.parent_entry_id).block}
        block = block.parent_entry
        max_number_of_nesting -= 1
      end
      @parent_blocks.reverse!
    end
end
