Rails.application.routes.draw do
  root to: 'welcome#index'

  get "home" => "home#index", as: :home
  devise_for :users, path: "",
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  resources :conversations, only: [:create]

end
