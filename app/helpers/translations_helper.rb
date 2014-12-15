module TranslationsHelper
  def link_google_translate(params = {}, html_options = {})
    url  = "https://translate.google.pl/?ie=UTF-8##{params[:from_language]}/#{params[:to_language]}/#{params[:text]}"
    name = params[:name] || params[:text] # default link name is text to translate

    link_to(name, url, html_options)
  end
end
