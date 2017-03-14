Rails.application.routes.draw do
  root to: 'welcome#index'

  get "home" => "home#index", as: :home
  devise_for :users, path: "",
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' },
    controllers: {registrations: "registrations"}
  resources :conversations, only: [:create]

  post "close_conversation" => "conversations#close", as: :close_conversation
  resources :users, except: [:index, :create]
  resources :statuses
end
