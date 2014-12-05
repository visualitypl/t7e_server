require "spec_helper"

describe "Projects API #update" do
  let(:project) { create(:project) }
  context 'with api key and lang parameter' do
    let(:api_key) { ApiKey.create(:project_id => project.id).access_token }
    it ' will get yaml file and response ok' do
      put "/api/v1/projects/#{api_key}"

      expect(response).to be_success
    end
  end

end