Rails.application.routes.draw do
  resources :products do
    post :import, on: :collection
  end
  root to: 'products#index'
end
