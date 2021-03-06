require "spec_helper"

describe 'Projects API #show' do
  let(:project) { create(:project) }

  context 'with proper project api key' do
    let(:api_key) { ApiKey.create(:project_id => project.id).access_token }
    let(:yaml_string) do
      File.read("config/locales/en.yml")
    end

    before do
      Language.create!(:name => "english", :iso_code => 'en')
      project.translation_entries.create!(:key => 'en', :key_type => 1, :path => 'en')
    end

    it 'succeds' do
     get "/api/v1/projects/#{api_key}", {
        :language => 'en'}

      expect(response).to be_success
    end

    context "with wrong language in params" do
      context 'without language' do
        it 'fails'
      end

      context 'with non exisiting language' do
        it 'fails'
      end
    end

    context 'with proper language in params' do
      it 'returns yaml file'
    end
  end

  context 'with not valid project api key' do
    let(:api_key) { 'wholetthedogsout' }

    it 'fails' do
      get "/api/v1/projects/#{api_key}"

      expect(response).not_to be_success
      expect(response.status).to eq(401)
    end
  end
end