Rails.application.routes.draw do
  get 'signup', to: 'users#new', as:'signup'
  get 'login', to: 'sessions#new', as:'login'
  get 'logout', to: 'sessions#destroy', as:'logout'


  resources :users
  resources :sessions
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get 'welcome/index'

  root 'welcome#index'
  # root 'sessions#new'
  resources :ideas do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
