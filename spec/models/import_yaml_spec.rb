require 'spec_helper'

describe 'ImportYAML' do
  let(:project) { create(:project) }

  context 'with valid yaml file, hierarchy should be correct' do
    # let(:api_key) { ApiKey.create(:project_id => project.id).access_token }
    let(:yaml_string) do
      File.read("spec/fixtures/valid_en.yml")
    end

    before do
      Language.create!(:name => "english", :iso_code => 'en')
    end

    it "saves translations to db" do
      action = Action::ImportYAML.new(project.id, 'en', yaml_string)
      action.save_to_db

      parent = project.translation_entries.find_by_path('date')

      expect(parent.parent_entry).to eq(nil)

      expect(project.translation_entries.find_by_path('date.formats').parent_entry).to eq(parent)

      parent = project.translation_entries.find_by_path('date.formats')
      expect(project.translation_entries.find_by_path('date.formats.default').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('date.formats.short').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('date.formats.long').parent_entry).to eq(parent)

      parent = project.translation_entries.find_by_path('simple_form')
      expect(parent.parent_entry).to eq(nil)

      expect(project.translation_entries.find_by_path('simple_form.labels').parent_entry).to eq(parent)

      parent = project.translation_entries.find_by_path('simple_form.labels')
      expect(project.translation_entries.find_by_path('simple_form.labels.user').parent_entry).to  eq(parent)
      expect(project.translation_entries.find_by_path('simple_form.labels.reservation').parent_entry).to  eq(parent)

      parent = project.translation_entries.find_by_path('simple_form.labels.user')
      expect(project.translation_entries.find_by_path('simple_form.labels.user.username').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('simple_form.labels.user.email').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('simple_form.labels.user.password').parent_entry).to eq(parent)

      parent = project.translation_entries.find_by_path('simple_form.labels.reservation')
      expect(project.translation_entries.find_by_path('simple_form.labels.reservation.date_range').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('simple_form.labels.reservation.number_of_people').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('simple_form.labels.reservation.price').parent_entry).to eq(parent)

      parent = project.translation_entries.find_by_path('main_menu')
      expect(parent.parent_entry).to eq(nil)

      expect(project.translation_entries.find_by_path('main_menu.home').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('main_menu.blog').parent_entry).to eq(parent)
      expect(project.translation_entries.find_by_path('main_menu.my_reservation').parent_entry).to eq(parent)

    end
  end
end