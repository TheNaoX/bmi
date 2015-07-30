require "rails_helper"

describe HomeController do
  describe "GET #index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it "returns the index" do
      get :index
      expect(response).to render_template "home/index"
    end

    context "when user is signed in" do
      let(:user) { create :user }

      before { sign_in :user, user }

      it "renders the proper template" do
        get :index
        expect(response).to render_template "home/signed_in_index"
      end
    end
  end
end
