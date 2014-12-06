json.array!(@translations) do |translation|
  json.extract! translation, :id, :translation_entry_id, :value, :language_id
  json.url translation_url(translation, format: :json)
end
