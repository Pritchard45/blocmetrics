Rails.application.routes.draw do
  get 'registerapplications/index'
  get 'registerapplications/show'
  get 'registerapplications/new'
  get 'registerapplications/edit'
  post 'registerapplications/new'
  devise_for :users

  resources :registerapplications, only: [:show, :create, :edit, :index, :new, :update, :destroy]


   namespace :api, defaults: { format: :json } do
     match '/events', to: 'events#preflight', via: [:options]
     resources :events, only: [:create]
  end

  get 'about' => 'welcome#about'

  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
