require 'pomo'
require 'pathname'

module Action
  class ImportGettext

    def initialize(project_id, language_iso_code, gettext_string)
      @translations = Pomo::PoFile.parse(gettext_string)
      @project = Project.find(project_id)
      @language_iso_code = language_iso_code
    end

    def save_to_db
      # .reject(&:fuzzy?)
      @translations.each do |t|
        next if t.msgid.blank? #atm do not insert metadata


        # make sure we store nil (NULL) values if msgstr is blank
        # so that the _() method will see that the string is not translated
        t.msgstr.blank? ? t.msgstr = nil : t.msgstr = t.msgstr

        te = @project.translation_entries.gettext.find_by_path(t.msgid)
        if !te
          action = Action::CreateTranslationEntry.new(@project, t.msgid, 'key', true)
          te = action.execute
        end

        # Translation record

        translation = te.translations.find_or_create_by(language: Language.find_by_iso_code!(@language_iso_code))
        # TODO: override?
        # #do not overwrite existing translations
        # next if key.translations.detect{|text| text.locale == locale}
        unless translation.value == t.msgstr
          translation.value = t.msgstr
          translation.save!
        end
      end
    end
  end
end