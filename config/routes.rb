Rails.application.routes.draw do

  root 'user/temples#index'

  namespace :admin do
    resources :temples, only: [:index, :show, :new, :edit, :update, :destroy, :create]
  end
  namespace :admin do
    get 'search', to: 'temples#search'
    get 'searchform', to: 'temples#searchform'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  namespace :admin do
    resources :memorys, only: [:index, :show, :destroy]
  end
  namespace :admin do
    resources :contacts, only: [:index, :show, :update]
  end
  namespace :user do
    get 'search', to: 'temples#search'
    get 'searchform', to: 'temples#searchform'
    resources :temples, only: [:index, :show, :edit, :update, :destroy] do
      resource :clips, only: [:create, :destroy]
    end
  end
  namespace :user do
    resources :users, only: [:show, :new, :edit, :update, :destroy, :create]
    get 'top', to: 'users#top'
  end
  namespace :user do
    resources :contacts, only: [ :new, :create]
    get 'top', to: 'users#top'
  end
  namespace :user do
      get 'memorys/:id/new' => 'memorys#new', as: 'new_memory'
    post 'memorys/:id/create' => 'memorys#create', as: 'create_memory'
    resources :memorys, only: [:index, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
