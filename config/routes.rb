Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
resources :users, only:[:index,:show]
devise_for :users
root to: 'homes#top'
resources :books 
get 'homes/about'=>'homes#about'
end