require 'yaml'

class Pair
  attr_accessor :parent, :key, :value, :type, :prefix
  def initialize(parent, key, value, prefix,type = :key)
    self.parent = parent
    self.key = key
    self.value = value
    self.type = type
    self.prefix = prefix
  end
end

module Action
  class ImportYAML

    def initialize(yaml_file_path = "config/locales/en.yml")
      @hash = YAML.load(File.read(yaml_file_path))
    end

    def get_pairs
      @pairs = []
      save_pair(nil, @hash)
      @pairs
    end

    private
    def save_pair(parent, myHash)
      #TODO: prefix need to be fixed
      myHash.each do |key, value|
        if value.is_a?(Hash)
          prefix = parent.nil? ? "#{key}." : "#{parent.prefix}#{key}."
          parent = Pair.new(parent, key, nil,prefix, :block)
          @pairs << parent
          save_pair(parent, value)
        else
          prefix = parent.nil? ? '' : parent.prefix
          @pairs << Pair.new(parent, key, value, prefix)
        end
      end
    end
  end
end