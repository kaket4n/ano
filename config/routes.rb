Rails.application.routes.draw do
  get    '/signin', to: 'sessions#new', as: :signin
  post   'sessions/create'
  delete 'sessions/destroy', as: :logout

  resources :users, only: %i(new create)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
