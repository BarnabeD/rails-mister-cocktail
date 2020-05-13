Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [ :show, :new, :create] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]
  delete 'cocktails/:id', to: 'cocktails#delete_photo'
  patch 'cocktails/:id', to: 'cocktails#update_photo', as: :update_photo
end
