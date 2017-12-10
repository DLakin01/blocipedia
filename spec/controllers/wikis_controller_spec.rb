require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:user) { create(:user) }
  let(:wiki) { create(:wiki, user: user) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: wiki.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show template" do
      get :show, params: {id: wiki.id}
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates a wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of Wikis by 1" do
      expect{ post :create, params: { user_id: user.id, wiki: { title: wiki.title, body: wiki.body, user: user, private: false } } }.to change(Wiki,:count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      post :create, params: { user_id: user.id, wiki: { title: wiki.title, body: wiki.body, user: user, private: false } }
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new wiki" do
      post :create, params: { user_id: user.id, wiki: { title: wiki.title, body: wiki.body, user: user, private: false } }
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      get :edit, params: {id: wiki.id}
      expect(response).to render_template(:edit)
    end

    it "assigns the wiki to be edited to @wiki" do
      get :edit, params: {id: wiki.id}
      expect(assigns(:wiki)).to eq wiki
    end
  end

  describe "PUT #update" do
    it "updates the wiki with the expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: { id: wiki.id, wiki: { title: new_title, body: new_body } }

      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end

    it "redirects to the updated wiki" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: { id: wiki.id, wiki: { title: new_title, body: new_body } }
      expect(response).to redirect_to :wiki
    end
  end

  describe "DELETE #destroy" do
    it "deletes the post" do
      delete :destroy, params: { id: wiki.id }
      count = Wiki.where(id: wiki.id).size
      expect(count).to eq 0
    end

    it "redirects to the wiki index" do
      delete :destroy, params: { id: wiki.id }
      expect(response).to redirect_to index_path
    end
  end

end
