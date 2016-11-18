Rails.application.routes.draw do
  root to: 'static#landing'

  # Authentication
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Signup
  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'

  # Profile
  get 'profile', to: 'profile#index'

  # Dashboard
  get 'dashboard', to: 'dashboard#index'

  # Workouts
  resources :workouts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :exercises, only: [:create, :destroy] do
      resources :work_sets, only: [:create, :update, :destroy]
    end
  end
end
