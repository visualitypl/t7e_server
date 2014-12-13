require "spec_helper"

describe ProjectLanguagesController do
  describe "routing" do

    it "routes to #index" do
      get("/project_languages").should route_to("project_languages#index")
    end

    it "routes to #new" do
      get("/project_languages/new").should route_to("project_languages#new")
    end

    it "routes to #show" do
      get("/project_languages/1").should route_to("project_languages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/project_languages/1/edit").should route_to("project_languages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/project_languages").should route_to("project_languages#create")
    end

    it "routes to #update" do
      put("/project_languages/1").should route_to("project_languages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/project_languages/1").should route_to("project_languages#destroy", :id => "1")
    end

  end
end
