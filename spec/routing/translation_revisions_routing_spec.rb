require "spec_helper"

describe TranslationRevisionsController do
  describe "routing" do

    it "routes to #index" do
      get("/translation_revisions").should route_to("translation_revisions#index")
    end

    it "routes to #new" do
      get("/translation_revisions/new").should route_to("translation_revisions#new")
    end

    it "routes to #show" do
      get("/translation_revisions/1").should route_to("translation_revisions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/translation_revisions/1/edit").should route_to("translation_revisions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/translation_revisions").should route_to("translation_revisions#create")
    end

    it "routes to #update" do
      put("/translation_revisions/1").should route_to("translation_revisions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/translation_revisions/1").should route_to("translation_revisions#destroy", :id => "1")
    end

  end
end
