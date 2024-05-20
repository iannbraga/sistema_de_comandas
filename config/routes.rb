Rails.application.routes.draw do
  get "dashboard", to: "pages#dashboard", as: :dashboard
  resources :itens
  resources :pagamentos
  resources :produtos
  resources :items
  resources :pedidos
  resources :comandas
  resources :vendas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#dashboard"
end
