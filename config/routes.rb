Rails.application.routes.draw do
  devise_for :users
  root to: 'teams#index'
  resources :members, only: [:index, :show] do
    resources :comments, only: [:create]
    resources :evaluations, only: [:create]
  end
  resources :rooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end
end
