Rails.application.routes.draw do

  resources :wikis, except: [:index]

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
