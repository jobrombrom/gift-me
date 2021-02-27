Rails.application.routes.draw do
  devise_for :users

  get '/success', to: 'pages#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :gifts, only: [:index] do
  #   resources :session_gifts, only: :create
  # end

  resources :shortlists, only: [:show, :create, :destroy] do
    resources :gifts, only: [:index]
    resources :session_gifts, only: :create
  end

  root to: 'shortlists#new'
end
