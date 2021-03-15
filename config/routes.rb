Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "skills#index"
  resources :skills do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  resources :rooms, only: [:index]
  get "message/:id" => "messages#show", as: "message"
  resources :messages, only: [:show, :create]
end
