LabControl::Application.routes.draw do
  resources :raports
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'pages#home'

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
end
