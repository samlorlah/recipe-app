Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'food#index'   # set the root to 'foods#index'

  resources :foods   # add a route for the 'foods' resource
  resources :recipes # add a route for the 'recipes' resource
end
