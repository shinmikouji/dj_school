Rails.application.routes.draw do
  root 'statics_pages#home'
  get '/', to: 'statics_pages#home'
  get '/top', to: 'statics_pages#top'
  get '/instructor', to: 'statics_pages#instructor'
  get '/plan', to: 'statics_pages#plan'
  get '/about', to: 'statics_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post 'guest_login', to: 'guest_login#guest'
  post 'admin_login', to: 'guest_login#admin_guest'
  resources :users
  resources :reservations, only: [:index, :new, :create, :destroy]
  resources :menus, only: [:index, :new, :show, :create, :destroy] do
    resources :reviews, only: [:index, :create, :destroy]
  end
  resources :requests, only: [:index, :new, :show, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
end
