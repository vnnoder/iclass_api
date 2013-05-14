require "spec_helper"

describe UserDeviceTokensController do
  describe "routing" do

    it "routes to #index" do
      get("/user_device_tokens").should route_to("user_device_tokens#index")
    end

    it "routes to #new" do
      get("/user_device_tokens/new").should route_to("user_device_tokens#new")
    end

    it "routes to #show" do
      get("/user_device_tokens/1").should route_to("user_device_tokens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_device_tokens/1/edit").should route_to("user_device_tokens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_device_tokens").should route_to("user_device_tokens#create")
    end

    it "routes to #update" do
      put("/user_device_tokens/1").should route_to("user_device_tokens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_device_tokens/1").should route_to("user_device_tokens#destroy", :id => "1")
    end

  end
end
