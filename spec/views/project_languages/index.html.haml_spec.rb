require 'spec_helper'

describe "project_languages/index" do
  before(:each) do
    assign(:project_languages, [
      stub_model(ProjectLanguage,
        :project => nil,
        :language => nil
      ),
      stub_model(ProjectLanguage,
        :project => nil,
        :language => nil
      )
    ])
  end

  it "renders a list of project_languages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
