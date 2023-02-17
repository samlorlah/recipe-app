Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "users#index"
  resources :users, only: [:index]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :show, :create, :destroy] do
    resources :recipe_foods, only: [:new, :edit, :create, :update, :destroy]
  end
  resources :shopping_lists, only: [:index]
  resources :public_recipes, only: [:index]
end
