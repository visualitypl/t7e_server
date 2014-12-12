require 'spec_helper'

describe "project_languages/new" do
  before(:each) do
    assign(:project_language, stub_model(ProjectLanguage,
      :project => nil,
      :language => nil
    ).as_new_record)
  end

  it "renders new project_language form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_languages_path, "post" do
      assert_select "input#project_language_project[name=?]", "project_language[project]"
      assert_select "input#project_language_language[name=?]", "project_language[language]"
    end
  end
end
