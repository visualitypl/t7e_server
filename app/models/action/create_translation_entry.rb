module Action
  class CreateTranslationEntry
    def initialize(project, path, key_type)
      #TODO: validation
      @project = project
      @path = path
      @key_type = key_type

      raise 'Invalid key type' unless @key_type.in?([:key, :block, 'key', 'block'])
    end

    def execute

      validate_path

      #first try to find it
      translation_entry = @project.translation_entries.find_by_path(@path.chomp('.'))

      #if not found, extract the key
      if !translation_entry
        parents = @path.split('.')
        key = parents.delete(parents[-1])

        translation_entry = TranslationEntry.new(
            project: @project,
            key: key,
            parent_entry_id: find_parent(parents),
            key_type: @key_type
        )
        translation_entry.save!
      end

      #TODO: create the translations

      translation_entry #return it
    end

    private

    def validate_path
      @path.split('.').each do |element|
        raise 'Invalid path' if element.blank?
      end
    end

    #TODO: could be done recursively
    #find the parent translation_entry, if one of them not found in the chain, then create
    def find_parent(parents)
      last_parent_id = nil
      parents.each do |parent|
        translation_entry = @project.translation_entries.where(key: parent, parent_entry_id: last_parent_id).first
        unless translation_entry
          translation_entry = TranslationEntry.create!(
                              project: @project,
                              key: parent,
                              parent_entry_id: last_parent_id,
                              key_type: :block
          )
        end
        last_parent_id = translation_entry.id
      end

      last_parent_id
    end

  end
end
