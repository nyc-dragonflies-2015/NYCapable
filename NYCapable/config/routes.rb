Rails.application.routes.draw do
  root 'home#index'
  resources :routes, only: :index

  # I think you should write out these routes as one-offs, because you're not
  # CRUDing "abouts" or "othe resources" these are just ... routes.
  resources :about, only: :index
  resources :other_resources, only: :index
end
