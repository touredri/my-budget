Rails.application.routes.draw do
  resources :expenses
  resources :groups
  devise_for :users
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  unauthenticated :user do
    root 'users#splash', as: :unauthenticated_root
  end
end
