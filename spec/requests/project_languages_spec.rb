require 'spec_helper'

describe "ProjectLanguages" do
  describe "GET /project_languages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get project_languages_path
      response.status.should be(200)
    end
  end
end
