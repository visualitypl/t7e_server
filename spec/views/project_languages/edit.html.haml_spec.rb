require 'spec_helper'

describe "project_languages/edit" do
  before(:each) do
    @project_language = assign(:project_language, stub_model(ProjectLanguage,
      :project => nil,
      :language => nil
    ))
  end

  it "renders the edit project_language form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_language_path(@project_language), "post" do
      assert_select "input#project_language_project[name=?]", "project_language[project]"
      assert_select "input#project_language_language[name=?]", "project_language[language]"
    end
  end
end
