Rails.application.routes.draw do
  root "topics#index"

  devise_for :users

  resources :topics do
    resources :comments, only: [:create, :show, :destroy]
  end
end
