Rails.application.routes.draw do

devise_for :users
resources :users, only: [:index, :show]
resources :books
get 'homes/about' => 'homes#about'
root to: "homes#top"
end

