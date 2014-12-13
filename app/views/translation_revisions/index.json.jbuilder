json.array!(@translation_revisions) do |translation_revision|
  json.extract! translation_revision, :id, :translation_id, :user_id, :value
  json.url translation_revision_url(translation_revision, format: :json)
end
