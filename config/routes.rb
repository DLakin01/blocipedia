Rails.application.routes.draw do

  get 'downgrade' => 'charges#downgrade'

  resources :users, only: [:show, :edit, :update]

  resources :charges, only: [:new, :create]

  resources :wikis

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
