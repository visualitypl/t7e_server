require 'spec_helper'

describe "project_languages/show" do
  before(:each) do
    @project_language = assign(:project_language, stub_model(ProjectLanguage,
      :project => nil,
      :language => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
