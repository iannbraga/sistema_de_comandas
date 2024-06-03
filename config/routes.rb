Rails.application.routes.draw do
  resources :movimentacao_estoques
  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :itens

  resources :pagamentos

  resources :produtos

  resources :pedidos do
    patch "pagar", on: :member
  end

  resources :comandas

  resources :vendas

  root "comandas#index"
end
