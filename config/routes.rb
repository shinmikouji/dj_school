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
  resources :users
  resources :reviews, only:[:index, :create, :destroy]
end
