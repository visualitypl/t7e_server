require 'spec_helper'

describe "TranslationRevisions" do
  describe "GET /translation_revisions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get translation_revisions_path
      response.status.should be(200)
    end
  end
end
