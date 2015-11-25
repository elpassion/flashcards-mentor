require 'rails_helper'

RSpec.describe "Admin::Decks", type: :request do
  describe "GET /admin_decks" do
    it "works! (now write some real specs)" do
      get admin_decks_path
      expect(response).to have_http_status(200)
    end
  end
end
