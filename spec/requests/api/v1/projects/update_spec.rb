require "spec_helper"

describe "Projects API #update" do
  let(:project) { create(:project) }
  context 'with proper params (so api_key, language, and yaml_string' do
    let(:api_key) { ApiKey.create(:project_id => project.id).access_token }
    let(:yaml_string) do
      YAML.load(File.read("config/locales/en.yml")).to_s
    end

    it "saves translations to db" do
      put "/api/v1/projects/#{api_key}", {
        :yaml => yaml_string,
        :language => 'en'}

      expect(response).to be_success
    end
  end

end