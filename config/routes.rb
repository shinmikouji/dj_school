Rails.application.routes.draw do
  root 'statics_pages#home'
  get '/top', to: 'statics_pages#top'
  get '/instructor', to: 'statics_pages#instructor'
  get 'plan', to: 'statics_pages#plan'
  get 'signup', to: 'users#new'
end
