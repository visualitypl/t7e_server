require 'spec_helper'

describe "translation_revisions/new" do
  before(:each) do
    assign(:translation_revision, stub_model(TranslationRevision,
      :translation => nil,
      :user => nil,
      :value => "MyText"
    ).as_new_record)
  end

  it "renders new translation_revision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", translation_revisions_path, "post" do
      assert_select "input#translation_revision_translation[name=?]", "translation_revision[translation]"
      assert_select "input#translation_revision_user[name=?]", "translation_revision[user]"
      assert_select "textarea#translation_revision_value[name=?]", "translation_revision[value]"
    end
  end
end
