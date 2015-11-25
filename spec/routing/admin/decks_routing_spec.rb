require "rails_helper"

RSpec.describe Admin::DecksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/decks").to route_to("admin/decks#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/decks/new").to route_to("admin/decks#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/decks/1").to route_to("admin/decks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/decks/1/edit").to route_to("admin/decks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/decks").to route_to("admin/decks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/decks/1").to route_to("admin/decks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/decks/1").to route_to("admin/decks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/decks/1").to route_to("admin/decks#destroy", :id => "1")
    end

  end
end
