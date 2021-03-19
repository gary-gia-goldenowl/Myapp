Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users do
    resources :categories do
      resources :posts
    end
  end  

  resources :categories
  resources :posts
  root to: 'home#index'

end
