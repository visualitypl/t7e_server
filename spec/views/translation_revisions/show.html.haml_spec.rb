require 'spec_helper'

describe "translation_revisions/show" do
  before(:each) do
    @translation_revision = assign(:translation_revision, stub_model(TranslationRevision,
      :translation => nil,
      :user => nil,
      :value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
