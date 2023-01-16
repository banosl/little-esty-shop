Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #merchants
  get '/', to: 'application#welcome'
  get '/merchants/:id/dashboard', to: 'merchants#show'
  resources :merchants do
    resources :invoices, only: [:index, :show, :update]
    resources :items, only: [:index, :show, :edit, :update, :new, :create]
    resources :bulk_discounts, only:[:index, :show, :new, :create, :destroy, :update, :edit]
  end

  #admins
  resources :admin, only:[:index]
  namespace :admin do
    resources :merchants, only:[:index, :show, :edit, :update, :new, :create]
    resources :invoices, only:[:index, :show, :update]
  end
end
