require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it "assigns the current user to @user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the edit view" do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
    end

    it "assigns the user to be edited to @user" do
      get :edit, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "PUT #update" do

    it "updates the user's bio as expected" do
      new_bio = RandomData.random_paragraph
      new_role = "admin"

      put :update, params: { id: user.id, user: { bio: new_bio, role: new_role } }

      updated_user = assigns(:user)
      expect(updated_user.id).to eq user.id
      expect(updated_user.bio).to eq new_bio
      expect(updated_user.role).to eq new_role
    end

    it "redirects to the updated user profile" do
      new_bio = RandomData.random_paragraph
      new_role = "admin"

      put :update, params: { id: user.id, user: { bio: new_bio, role: new_role } }
      expect(response).to redirect_to user
    end

  end
end
