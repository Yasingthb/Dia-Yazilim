Rails.application.routes.draw do
  resources :brands
  resources :products
  root to: 'brands#index'
end