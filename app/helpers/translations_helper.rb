module TranslationsHelper
  def modal_button(key_type)
    key_type == 'key' ? 'Add key' : 'Add block'
  end
end
