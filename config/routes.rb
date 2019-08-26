Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'user/temples#index'

   namespace :admin do
     resources :temples, only: [:index, :show, :new, :edit, :update, :destroy, :create]
     get 'search', to: 'temples#search'
     get 'searchform', to: 'temples#searchform'
     resources :users, only: [:index, :show, :edit, :update, :destroy]
     resources :memorys, only: [:index, :show, :destroy]
     resources :contacts, only: [:index, :show, :update]
     resources :questions, only: [ :index,:show, :destroy] do
       resource :answers, only: [:destroy]
     end
   end
  namespace :user do
    get 'search', to: 'temples#search'
    get 'searchform', to: 'temples#searchform'
    resources :temples, only: [:index, :show, :edit, :update, :destroy] do
      resource :clips, only: [:create, :destroy]
    end
    resources :users, only: [:show, :new, :edit, :update, :destroy, :create]
    get 'top', to: 'users#top'
    resources :contacts, only: [ :new, :create]
    get 'top', to: 'users#top'
      get 'memorys/:id/new' => 'memorys#new', as: 'new_memory'
    post 'memorys/:id/create' => 'memorys#create', as: 'create_memory'
    resources :memorys, only: [:index, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :questions, only: [ :index,:show, :destroy, :create] do
      resource :answers, only: [ :new, :create,:destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
