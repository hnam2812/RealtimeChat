Rails.application.routes.draw do
  root to: 'welcome#index'

  get "home" => "home#index", as: :home
  devise_for :users, path: "",
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' },
    controllers: {registrations: "registrations"}
  resources :conversations, only: [:create]

  post "close_conversation" => "conversations#close", as: :close_conversation
  resources :users, only: :show
  resources :statuses, except: [:index, :new]
  resources :comments, except: [:index, :new]
  resources :relationships, only: [:create, :destroy]
  resources :search, only: [:index]
end
