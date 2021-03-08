Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "skills#index"
  resources :skills do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index]
  resources :rooms, only: [:create, :show]
  resources :messages, only: [:create]
end
