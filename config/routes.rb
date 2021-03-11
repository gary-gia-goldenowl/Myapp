Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/mypost", to: "posts#list"
  get "/myuser", to: "users#list"
  get "/mycategory", to: "categories#list"
end
