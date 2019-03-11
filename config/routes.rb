Rails.application.routes.draw do
  get 'registerapplications/index'
  get 'registerapplications/show'
  get 'registerapplications/new'
  get 'registerapplications/edit'
  post 'registerapplications/new'
  devise_for :users

  resources :registerapplications, only: [:show, :create, :edit, :index, :new, :destroy]

  get 'about' => 'welcome#about'

  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
