class TranslationEntryQuery
  def initialize(params = {})
    @project = params[:project]
    @search_keyword  = params[:search_keyword]
  end

  def results
    @project.translation_entries.key.joins(:translations)
      .where('translations.value ILIKE ? OR translation_entries.path ILIKE ?', "%#{@search_keyword}%", "%#{@search_keyword}%")
  end
end