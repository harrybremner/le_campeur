Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  resources :campervans do
    resources :bookings, except: :destroy
  end
  resources :users, only: [:show, :destroy, :index]
  resources :bookings, only: [:destroy]
end
