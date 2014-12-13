require 'spec_helper'

describe "translation_revisions/index" do
  before(:each) do
    assign(:translation_revisions, [
      stub_model(TranslationRevision,
        :translation => nil,
        :user => nil,
        :value => "MyText"
      ),
      stub_model(TranslationRevision,
        :translation => nil,
        :user => nil,
        :value => "MyText"
      )
    ])
  end

  it "renders a list of translation_revisions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
