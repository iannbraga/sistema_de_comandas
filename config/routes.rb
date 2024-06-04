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

  post "comandas/:id/pagar", to: "pagamentos#pagar", as: "pagar_comanda"

  root "comandas#index"
end
