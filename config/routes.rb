Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  resources :books, only: [:create, :index, :show,:edit,:destroy,:update]
  resources :users, only: [:show, :edit,:update,:index,:create]
  
  get "/home/about"=>"home#about", as: 'about'
end
