Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  root to: "home#top"
  devise_for :users
  resources :books, only: [:create, :index, :show,:edit,:destroy,:update] do
    resources :favorites, only: [:create, :destroy]
    resources:book_comments,only:[:create,:destroy]
  end
  resources :users, only: [:show, :edit,:update,:index,:create]
  
  get "/home/about"=>"home#about", as: 'about'
end
