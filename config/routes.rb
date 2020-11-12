Rails.application.routes.draw do

  devise_for :users
  root "tops#index"
  get "/home/about" => "users#about"
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
resources :users, only: [:show, :edit, :update, :index, :new, :about]


end
