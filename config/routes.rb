Rails.application.routes.draw do
  devise_for :users
  root to: 'shortlists#new'

  get '/success', to: 'pages#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gifts, only: [:index] do
    resources :session_gifts, only: :create
  end

  resources :shortlists, only: [:show,:create,:destroy]

end
