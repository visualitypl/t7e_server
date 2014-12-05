json.array!(@translation_entries) do |translation_entry|
  json.extract! translation_entry, :id, :key, :key_type, :parent_entry_id, :path, :project_id
  json.url translation_entry_url(translation_entry, format: :json)
end
