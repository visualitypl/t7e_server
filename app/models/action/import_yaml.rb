require 'yaml'

class Pair
  attr_accessor :parent, :key, :value, :key_type, :path
  def initialize(parent, key, value, path,key_type = :key)
    self.parent = parent
    self.key = key
    self.value = value
    self.key_type = key_type
    self.path = path
  end
end

module Action
  class ImportYAML

    def initialize(project_id, language_iso_code, yaml_string)
      @hash = YAML.load(yaml_string)
      @project = Project.find(project_id)
      @language_iso_code = language_iso_code
    end

    def get_pairs
      @pairs = []
      save_pair(nil, @hash)
      @pairs
    end

    def save_to_db
      get_pairs
      @pairs.each do |pair|
        te = TranslationEntry.new
        te.key = pair.key
        te.path = pair.path
        te.key_type = pair.key_type.to_s
        te.project = @project

#finding parent #TODO: refactor
        if pair.parent
          parent = TranslationEntry.where(path: pair.parent.path, project: @project).first
          unless parent
            parent = TranslationEntry.create!(path: pair.parent.path, key_type: 'block', project: @project)
          end
        else
          parent = nil
        end

        if pair.key_type.eql?(:key)
          te.translations.build(value: pair.value, language: Language.find_by_iso_code!(@language_iso_code))
        end

        te.parent_entry = parent
        te.save!
      end
    end

    private
    #TODO: refactor
    def save_pair(parent, myHash)
      myHash.each do |key, value|
        if value.is_a?(Hash)
          path = parent.nil? ? "#{key}" : "#{parent.path}.#{key}"
          parent = Pair.new(parent, key, nil,path, :block)
          @pairs << parent
          save_pair(parent, value)
        else
          path = parent.nil? ? "#{key}" : "#{parent.path}.#{key}"
          @pairs << Pair.new(parent, key, value, path)
        end
      end
    end
  end
end