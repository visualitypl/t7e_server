json.array!(@project_languages) do |project_language|
  json.extract! project_language, :id, :project_id, :language_id
  json.url project_language_url(project_language, format: :json)
end
