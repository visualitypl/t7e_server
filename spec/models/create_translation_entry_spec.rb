require 'spec_helper'

describe 'Action::CreateTranslationEntry' do
  let (:project) { create(:project) }

  before do
    Language.create!(:name => "english", :iso_code => 'en')
  end

  context 'Empty collection' do
    it 'create translation entries with hierarchy' do
      Action::CreateTranslationEntry.new(project, 'a', :block).execute
      Action::CreateTranslationEntry.new(project, 'a.b', :block).execute
      Action::CreateTranslationEntry.new(project, 'a.b.c', :block).execute
      Action::CreateTranslationEntry.new(project, 'a.d', :block).execute
      Action::CreateTranslationEntry.new(project, 'a.e', :block).execute
      Action::CreateTranslationEntry.new(project, 'a.d.f', :block).execute

      expect(is_parent?(project, 'a', nil)).to eq(true)
      expect(is_parent?(project, 'a.b', 'a')).to eq(true)
      expect(is_parent?(project, 'a.b.c', 'a.b')).to eq(true)
      expect(is_parent?(project, 'a.d', 'a')).to eq(true)
      expect(is_parent?(project, 'a.d.f', 'a.d')).to eq(true)
    end

  end
  context 'Imported collection' do
    let(:yaml_string) do
      File.read("spec/fixtures/valid_en.yml")
    end
    it 'created translation must be in proper path' do
      Action::ImportYAML.new(project.id, 'en', yaml_string).save_to_db

      expect do
        Action::CreateTranslationEntry.new(project, 'simple_form.labels.reservation.info', :key).execute
      end.to change{TranslationEntry.count}.by(1)

      expect(is_parent?(project, 'simple_form.labels.reservation.info', 'simple_form.labels.reservation')).to eq(true)

    end
  end
  context 'Create parents' do
    it 'should create the parents' do
      expect do
        Action::CreateTranslationEntry.new(project, 'a.b.c', :key).execute
      end.to change { TranslationEntry.count }.by(3)

      expect(is_parent?(project, 'a', nil)).to eq(true)
      expect(is_parent?(project, 'a.b', 'a')).to eq(true)
      expect(is_parent?(project, 'a.b.c', 'a.b')).to eq(true)
    end
  end
  context 'Do not create parents' do
    it 'should not create the existing parents' do
      expect do
        Action::CreateTranslationEntry.new(project, 'a.b.c', :key).execute
      end.to change { TranslationEntry.count }.by(3)

      expect do
        Action::CreateTranslationEntry.new(project, 'a.b.d', :key).execute
      end.to change { TranslationEntry.count }.by(1)

      expect(is_parent?(project, 'a.b.d', 'a.b')).to eq(true)
    end
  end

  context 'Invalid input' do
    it 'should not create' do
      expect do
        Action::CreateTranslationEntry.new(project, 'a', :ket).execute
      end.to raise_error('Invalid key type')

      expect do
        Action::CreateTranslationEntry.new(project, 'a..c', :key).execute
      end.to raise_error('Invalid path')

    end
  end
end

def is_parent?(project, path, parent_path)
  project.translation_entries.find_by_path(path).parent_entry == project.translation_entries.find_by_path(parent_path)
end