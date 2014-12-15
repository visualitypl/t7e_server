module TranslationsHelper
  def link_google_translate(text, from_language, to_language)
    "https://translate.google.pl/?ie=UTF-8##{from_language}/#{to_language}/#{text}"
  end
end
