require "rails_helper"

describe BodyMassIndicesController do
  let(:user) { create :user }

  describe "GET #index" do
    context "when user logged in" do
      before { sign_in :user, user }

      it "is success" do
        get :index, format: :json
        expect(response).to be_success
      end

      it "returns the collection of body mass indices" do
        get :index, format: :json
        expect(response.body).to eq user.body_mass_indices.to_json
      end
    end

    context "when user logged in" do
      it "is unauthorized" do
        get :index, format: :json
        expect(response).to be_unauthorized
      end
    end
  end

  describe "POST #create" do
    let(:attributes) { { height: 1.77, weight: 89 } }

    context "when user signed in" do
      before { sign_in :user, user }

      it "creates the index" do
        post :create, body_mass_index: attributes, format: :json
        expect(response).to be_success
      end

      it "returns the index on json format" do
        post :create, body_mass_index: attributes, format: :json
        expect(response.body).to eq user.body_mass_indices.first.to_json
      end

      context "when a parameter is missing" do
        it "returns unprocessable entity" do
          post :create, body_mass_index: { height: 10 }, format: :json
          expect(response.status).to eq 422
        end
      end
    end

    context "when user is not signed in" do
      it "is unauthorized" do
        post :create, body_mass_index: { height: 10, weight: 10 }, format: :json
        expect(response).to be_unauthorized
      end
    end
  end
end
