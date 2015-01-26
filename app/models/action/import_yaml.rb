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
      @hash = YAML.load(yaml_string)[language_iso_code]
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
        te = @project.translation_entries.find_by_path(pair.path)
        if !te
          action = Action::CreateTranslationEntry.new(@project, pair.path, pair.key_type)
          te = action.execute
        end

        if pair.key_type.eql?(:key)
          translation = te.translations.find_or_create_by(language: Language.find_by_iso_code!(@language_iso_code))
          unless translation.value == pair.value
            translation.value = pair.value
            translation.save!
          end
        end

      end
    end

    private
    #TODO: refactor
    def save_pair(parent, myHash)
      myHash.each do |key, value|
        path = parent.nil? ? key : "#{parent.path}.#{key}"
        if value.is_a?(Hash)
          block = Pair.new(parent, key, nil,path, :block)
          @pairs << block
          save_pair(block, value)
        else
          @pairs << Pair.new(parent, key, value, path)
        end
      end
    end
  end
end