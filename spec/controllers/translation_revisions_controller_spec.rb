require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TranslationRevisionsController do

  # This should return the minimal set of attributes required to create a valid
  # TranslationRevision. As you add validations to TranslationRevision, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "translation" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TranslationRevisionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all translation_revisions as @translation_revisions" do
      translation_revision = TranslationRevision.create! valid_attributes
      get :index, {}, valid_session
      assigns(:translation_revisions).should eq([translation_revision])
    end
  end

  describe "GET show" do
    it "assigns the requested translation_revision as @translation_revision" do
      translation_revision = TranslationRevision.create! valid_attributes
      get :show, {:id => translation_revision.to_param}, valid_session
      assigns(:translation_revision).should eq(translation_revision)
    end
  end

  describe "GET new" do
    it "assigns a new translation_revision as @translation_revision" do
      get :new, {}, valid_session
      assigns(:translation_revision).should be_a_new(TranslationRevision)
    end
  end

  describe "GET edit" do
    it "assigns the requested translation_revision as @translation_revision" do
      translation_revision = TranslationRevision.create! valid_attributes
      get :edit, {:id => translation_revision.to_param}, valid_session
      assigns(:translation_revision).should eq(translation_revision)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TranslationRevision" do
        expect {
          post :create, {:translation_revision => valid_attributes}, valid_session
        }.to change(TranslationRevision, :count).by(1)
      end

      it "assigns a newly created translation_revision as @translation_revision" do
        post :create, {:translation_revision => valid_attributes}, valid_session
        assigns(:translation_revision).should be_a(TranslationRevision)
        assigns(:translation_revision).should be_persisted
      end

      it "redirects to the created translation_revision" do
        post :create, {:translation_revision => valid_attributes}, valid_session
        response.should redirect_to(TranslationRevision.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved translation_revision as @translation_revision" do
        # Trigger the behavior that occurs when invalid params are submitted
        TranslationRevision.any_instance.stub(:save).and_return(false)
        post :create, {:translation_revision => { "translation" => "invalid value" }}, valid_session
        assigns(:translation_revision).should be_a_new(TranslationRevision)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TranslationRevision.any_instance.stub(:save).and_return(false)
        post :create, {:translation_revision => { "translation" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested translation_revision" do
        translation_revision = TranslationRevision.create! valid_attributes
        # Assuming there are no other translation_revisions in the database, this
        # specifies that the TranslationRevision created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TranslationRevision.any_instance.should_receive(:update).with({ "translation" => "" })
        put :update, {:id => translation_revision.to_param, :translation_revision => { "translation" => "" }}, valid_session
      end

      it "assigns the requested translation_revision as @translation_revision" do
        translation_revision = TranslationRevision.create! valid_attributes
        put :update, {:id => translation_revision.to_param, :translation_revision => valid_attributes}, valid_session
        assigns(:translation_revision).should eq(translation_revision)
      end

      it "redirects to the translation_revision" do
        translation_revision = TranslationRevision.create! valid_attributes
        put :update, {:id => translation_revision.to_param, :translation_revision => valid_attributes}, valid_session
        response.should redirect_to(translation_revision)
      end
    end

    describe "with invalid params" do
      it "assigns the translation_revision as @translation_revision" do
        translation_revision = TranslationRevision.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TranslationRevision.any_instance.stub(:save).and_return(false)
        put :update, {:id => translation_revision.to_param, :translation_revision => { "translation" => "invalid value" }}, valid_session
        assigns(:translation_revision).should eq(translation_revision)
      end

      it "re-renders the 'edit' template" do
        translation_revision = TranslationRevision.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TranslationRevision.any_instance.stub(:save).and_return(false)
        put :update, {:id => translation_revision.to_param, :translation_revision => { "translation" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested translation_revision" do
      translation_revision = TranslationRevision.create! valid_attributes
      expect {
        delete :destroy, {:id => translation_revision.to_param}, valid_session
      }.to change(TranslationRevision, :count).by(-1)
    end

    it "redirects to the translation_revisions list" do
      translation_revision = TranslationRevision.create! valid_attributes
      delete :destroy, {:id => translation_revision.to_param}, valid_session
      response.should redirect_to(translation_revisions_url)
    end
  end

end
