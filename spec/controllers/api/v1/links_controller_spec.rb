require "rails_helper"

RSpec.describe Api::V1::LinksController, type: :controller do
  include Controllers::JsonHelpers
  before(:each) do
    @user = User.create(email: "jphoenix@gmail.com", password_digest: "password")
    session[:current_user_id] = @user.id
    links = [{url: "http://google.com", title: "google"}, {url: "http://mycoolsite.com",
    title: "mine"}]
    @user.links.create(links)
  end

  describe "GET #index" do
    it "returns all links for that user" do
      get :index, format: :json

      expect(json.count).to eq(@user.links.count)
    end

    it "doesn't return links if user is not logged in" do
      session[:current_user_id] = nil
      get :index, format: :json

      expect(response).to redirect_to(login_path)
    end
  end

  describe "POST #create" do
    it "returns a newly created link" do
      pre_count = @user.links.count
      new_link = {url: "http://stuff.com", title: "my stuff"}
      post :create, link: new_link, format: :json

      expect(json["title"]).to eq(new_link[:title])
      expect(json["url"]).to eq(new_link[:url])
      expect(@user.links.count).to eq(pre_count + 1)
    end

    it "must have a title" do
      new_link = {url: "http://stuff.com", title: ""}
      post :create, link: new_link, format: :json

      expect(json["status"]).to eq(401)
    end

    it "must have a valid url" do
      new_link = {url: "http//stuff.com", title: "my stuff"}
      post :create, link: new_link, format: :json

      expect(json["status"]).to eq(401)
      expect(flash[:notice]).to eq("Must enter a valid link and have a title")
    end
  end
end
