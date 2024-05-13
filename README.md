# README

1. Comanda:
   - Número (identificador único da comanda)
   - Total (valor total dos pedidos na comanda)
   - Lista de Pedidos (para armazenar os pedidos feitos nessa comanda)
rails generate model Comanda numero:integer total:decimal 

class Comanda < ApplicationRecord
  has_many :pedidos
  has_many :pagamentos
end


2. Pedido:
   - Número (identificador único do pedido)
   - Comanda (referência à comanda associada ao pedido)
   - Data e hora do pedido
   - Status (em andamento, concluído, cancelado, etc.)
   - Observações (por exemplo, preferências do cliente)
rails generate model Pedido comanda:references data:date hora:time observacoes

class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens
end


3. Item:
   - Número (identificador único do item)
   - Produto (referência ao produto associado ao item)
   - Quantidade
   - Preço unitário
   - Subtotal
   - Observações (por exemplo, ingredientes extras)
rails generate model Item pedido:references produto:references quantidade:integer preco_unitario:decimal subtotal:decimal observacoes

class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
end


4. Produto:
   - Nome
   - Descrição
   - Preço
   - Estoque
   - Categoria (por exemplo, bebidas, petiscos, pratos principais)

rails generate model Produto nome:string descricao:text preco:decimal estoque:integer categoria

class Produto < ApplicationRecord
  has_many :itens
end


5. Pagamento:
   - Comanda (referência à comanda associada ao pagamento)
   - Método de pagamento (dinheiro, cartão, etc.)
   - Valor total pago
   - Troco (apenas para pagamento em dinheiro)
   - Data e hora do pagamento
rails generate model Pagamento comanda:references metodo_pagamento:string valor_total_pago:decimal troco:decimal data:date hora:time

class Pagamento < ApplicationRecord
  belongs_to :comanda
end

<!-- 
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
