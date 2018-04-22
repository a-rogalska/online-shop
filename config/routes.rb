Rails.application.routes.draw do
  root to: "products#index"

  resources :products, only: :index
  resources :orders, only: [:show, :new, :create] do
    post :summary, on: :member
  end

  get "baskets/total" => 'baskets#total'
  get "baskets/products" => 'baskets#products'
  delete "baskets/clear" => 'baskets#clear'
  patch "baskets/update_product" => 'baskets#update_product'
end
