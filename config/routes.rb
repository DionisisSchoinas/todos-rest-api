Rails.application.routes.draw do
  resources :todos do
    resources :items
  end

  post 'auth/login', to: 'authentication#authenticate'
  get 'auth/logout', to: 'authentication#logout'
  post 'signup', to: 'users#create'
end
