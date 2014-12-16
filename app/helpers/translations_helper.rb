module TranslationsHelper
  #= link_to_google_translate 'Translate on Google', from_language: 'pl', to_language: 'en', text: 'Jeden', target: '_blank'
  def link_to_google_translate(name, options = {})
    raise "Must pass a hash containing 'from_language'" if not options.is_a?(Hash) or not options.has_key?(:from_language)
    raise "Must pass a hash containing 'to_language'" if not options.is_a?(Hash) or not options.has_key?(:to_language)
    raise "Must pass a hash containing 'text'" if not options.is_a?(Hash) or not options.has_key?(:text)

    url  = "https://translate.google.pl/?ie=UTF-8##{options[:from_language]}/#{options[:to_language]}/#{options[:text]}"

    options.delete(:from_language)
    options.delete(:to_language)
    options.delete(:text)

    link_to(name, url, options)
  end
end
