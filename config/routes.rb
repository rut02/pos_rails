Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :age_range_bills
  resources :gender_bills
  resources :age_ranges
  resources :genders
  resources :bills
  resources :products
  resources :product_categories
  resources :reservations
  resources :tables
  resources :staffs
  resources :members
  resources :status_masters

  get "get_available_tables" => "tables#get_available_tables"
  get "get_reserved_reservations" => "reservations#reserved"

  # order_items
  get "order_items/order/:id" => "order_items#get_order_items_by_order"
  get "order_items/bill/:id" => "order_items#get_order_items_by_bill"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
