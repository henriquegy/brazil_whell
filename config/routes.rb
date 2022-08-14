Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :truck_drivers, only: %i[show create update destroy]
  get "/truck_drivers/deliveries_by_fiter/:id", to: "truck_drivers#deliveries_by_fiter"
end
