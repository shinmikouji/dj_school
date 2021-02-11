Rails.application.routes.draw do
  get '/', to: 'statics_pages#home'
  get '/top', to: 'statics_pages#top'
  get '/instructor', to: 'statics_pages#instructor'
  get 'plan', to: 'statics_pages#plan'
  get 'signup', to: 'users#new'
  resources :users
end
