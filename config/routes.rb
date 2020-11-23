Rails.application.routes.draw do
  devise_for :users
  root to: 'teams#index'
  resources :members, only: [:index, :show] do
    resources :comments, only: [:create]
  end
end
