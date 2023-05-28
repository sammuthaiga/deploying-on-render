Rails.application.routes.draw do
  resources :users, param: :_username
  resources :plumbers
  resources :services, except: [:new, :edit]
  resources :reviews, except: [:new, :edit]
  resources :plumbers do
    resources :availabilities, only: [:index, :show, :create, :update, :destroy]
  end
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end