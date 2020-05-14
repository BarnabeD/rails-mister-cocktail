Rails.application.routes.draw do
  root to: 'cocktails#index'
  delete 'cocktails/:id/photo', to: 'cocktails#delete_photo', as: :delete_photo
  patch 'cocktails/:id', to: 'cocktails#update_photo', as: :update_photo
  resources :cocktails, only: [ :show, :new, :destroy, :create] do
    resources :doses, only: [ :new, :create ]
  end
  # delete 'cocktails/:id', to: 'cocktails#delete_photo', as: :delete_photo
  resources :doses, only: [ :destroy ]
end
