Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/posts", to: "posts#list"
  get "/users", to: "users#list"
  get "/categories", to: "categories#list"
end
