require 'yaml'

module Action
  class ExportYAML
#TODO: project based
    def initialize(project_id, language_iso_code)
      @project = Project.find(project_id)
      @language = Language.find_by_iso_code!(language_iso_code)
    end

    def get_yaml
      root_key = @project.translation_entries.where('parent_key_id IS NULL').first!
      hash = directory_hash(root_key, root_key.key)
      hash.to_yaml
    end

    private
    def directory_hash(path, name=nil)
      data = {(name || path) => (children = [])}
      TranslationEntry.where(parent_entry: path).each do |entry|
        if entry.block?
          children << directory_hash(entry, entry.key)
        else
          children << {
              entry.key => Translation.where(translation_entry: entry, language: @language)
          }
        end
      end
      return data
    end
  end
end