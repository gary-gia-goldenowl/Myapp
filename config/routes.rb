Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/female', :to => 'users#female'  #custom url
  get 'users/male', :to => 'users#male'  #custom url
  get 'users/top', :to => 'users#top'  #custom url


  resources :users do
    resources :categories do
      resources :posts
    end
  end  
  resources :categories
  resources :posts
  root to: 'home#index'
end
