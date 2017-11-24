Rails.application.routes.draw do

  resources :cocktails, only: [ :index, :show, :new, :create ]  do
    resources :doses, only: [ :new, :create ]
    resources :reviews, only: [ :show, :new, :create ]
  end
  resources :doses, only: [ :destroy ]

  root 'cocktails#index'

end
