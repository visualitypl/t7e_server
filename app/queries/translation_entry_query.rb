class TranslationEntryQuery
  def initialize(params = {})
    @project = params[:project]
    @search_keyword  = params[:search_keyword]
  end

  def results
    @project.translation_entries.key.joins(:translations)
      .where('translations.value LIKE ? OR translation_entries.path LIKE ?', "%#{@search_keyword}%", "%#{@search_keyword}%")
  end
end