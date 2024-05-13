Rails.application.routes.draw do
  resources :pagamentos
  resources :produtos
  resources :items
  resources :pedidos
  resources :comandas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
