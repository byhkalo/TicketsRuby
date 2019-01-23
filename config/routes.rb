Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  get 'events/new'
  get 'events/create'
  get 'events/:id' => 'events#show'
  resources :events, :only => [:index, :new, :create, :show]

  resources :tickets
  root 'tickets#index'
  root :to => "static#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
