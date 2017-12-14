Rails.application.routes.draw do

  devise_for :users

  resources :wikis

  resources :users, only: [:show, :edit, :update]

  resources :charges, only: [:new, :create]

  get 'downgrade' => 'charges#downgrade'

  get 'modify_privacy' => 'wikis#modify_privacy'

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
