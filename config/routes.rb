Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :users, only: [:show] do
    resources :patients do
      resources :diseases do
        resources :symptoms
      end
    end
  end
end
