Rails.application.routes.draw do

devise_for :users
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end
resources :users, only: [:index, :show,:edit,:update]
resources :books
get 'home/about' => 'home#about'
root to: "home#top"


end

