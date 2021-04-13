require 'rails_helper'

RSpec.describe "Users", type: :request do
  avatar = File.open(File.join(Rails.root, '/spec/fixtures/files/buy-1.jpg'))
  before { @user1 = User.create(first_name: 'Gia', last_name: 'Ha Gia Huy', email: 'abc@gmail.com', avatar: fixture_file_upload('buy-1.jpg', 'image/jpg'), gender: 'male', age: 15, role: 'user') }
  describe "GET /users" do
  
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST users#create" do
    it 'create user with valid attributes' do
      user_params = { user: {
        first_name: 'Gia',
        last_name: 'Ha Gia Huy',
        email: 'abc@gmail.com',
        gender: 'male',
        age: 15,
        role: 'user'
        }}
      post users_path, :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      expect(response).to have_http_status(302)
    end
  end

  describe "POST users#show" do
    it "Show user" do
      get "/users/#{@user1.id}", params: {id: @user1.id}
      expect(response).to have_http_status(200)
    end  
  end

  describe "POST users#new" do
  it "New user" do
    get new_user_path
    expect(response).to have_http_status(200)
    end
  end

  describe "GET users#Edit" do
    it 'Edit user with valid attributes' do
      user_params = { user: {
        first_name: 'Tony',
        last_name: 'G',
        email: 'abc@gmail.com',
        gender: 'male',
        age: 15,
        role: 'user'
        }}

      new_user_params = { user: {
        first_name: 'Tony',
        last_name: 'G',
        email: 'xyz@gmail.com',
        gender: 'male',
        age: 15,
        role: 'user'
        }}
        user = User.create(user_params[:user])
        get "/users/#{user.id}/edit", :params => new_user_params.to_json, :headers => { "Content-Type": "application/json" }
        expect(response).to have_http_status(200)
      
    end
  end

  describe "POST users#delete" do
    it "Delete user" do
      delete "/users/#{@user1.id}", params: {id: @user1.id}
      expect(response).to have_http_status(302)
    end  
  end

end
