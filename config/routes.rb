Rails.application.routes.draw do

  devise_for :users
  
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  root 'items#index'

  resources :preferences, only: [:index, :edit, :update]


  resources :items, concerns: :paginatable




end
