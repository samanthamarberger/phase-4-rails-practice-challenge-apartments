Rails.application.routes.draw do
  resources :leases, only: [:index, :create, :delete]
  resources :tenants, only: [:show, :index, :create, :update, :destroy]
  resources :apartments, only: [:show, :index, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
