require 'yaml'

module Action
  class ExportYAML
#TODO: project based
    def initialize(project_id, language_iso_code)
      @project = Project.find(project_id)
      @language = Language.find_by_iso_code!(language_iso_code)
    end

    def get_yaml
      hash = {@language.iso_code => directory_hash(nil, '')}
      header + hash.to_yaml
    end

    def header
      content = <<-T7E
# This file is generated by t7e
# for more information https://github.com/visualitypl/t7e
#
#
#


      T7E
    end

    private
    def directory_hash(path, name=nil)
      data = (children = {})
      @project.translation_entries.where(parent_entry: path).each do |entry|
        if entry.block?
          children[entry.key] = directory_hash(entry, entry.key)
        else
          value = (Translation.where(translation_entry: entry, language: @language).first.try(:value) ||'')
          children[entry.key] = (value.start_with?('[') && value.ends_with?(']')) ? eval(value) : value
        end
      end
      return data
    end
  end
end