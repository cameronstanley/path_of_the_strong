Rails.application.routes.draw do
  root to: 'static#landing'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'

  get 'dashboard', to: 'dashboard#index'
end
