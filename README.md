# README

## Instalar ruby
Ruby 3.2.2+
Ubuntu: https://gorails.com/setup/ubuntu/22.04

Windows: https://rubyinstaller.org/downloads/
  NodeJs
  Yarn

### Rodar projeto
1 - Execute 'git clone https://github.com/iannbraga/sistema_de_comandas/git'
2 - Abra a pasta do projeto
3 - Execute 'bundle' para instalar os pacotes e dependencias
4 - Execute 'rails db:create db:migrate db:seed' para criar o banco de dados, as tabelas, realizar os ajustes e popular o banco
5 - Execute 'yarn install' para baixar as bibliotecas de terceiros como Bootstrap, Coocon, Stimulus, etc.
6 - Execute 'rails assets:precompile'
7 - Execute 'rails s'

Agora basta acessar o navegar e digitar o endereço:
'localhost:3000'

#### Modelos:
1. Comanda:
   - Número (identificador único da comanda)
   - Total (valor total dos pedidos na comanda)
   - Lista de Pedidos (para armazenar os pedidos feitos nessa comanda)
rails g scaffold Comanda numero:integer total:decimal 

class Comanda < ApplicationRecord
  has_many :pedidos
  has_many :pagamentos
end


2. Pedido:
   - Número (identificador único do pedido)
   - Comanda (referência à comanda associada ao pedido)
   - Data e hora do pedido
   - Lista de Itens
   - Status (em andamento, concluído, cancelado, etc.)
   - Observações (por exemplo, preferências do cliente)
rails g scaffold Pedido comanda:references data:date hora:time observacoes

class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens
end


3. Item:
   - Produto (referência ao produto associado ao item)
   - Quantidade
   - Preço unitário
   - Subtotal
   - Observações (por exemplo, ingredientes extras)
rails g scaffold Item pedido:references produto:references quantidade:integer preco_unitario:decimal subtotal:decimal observacoes

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

rails g scaffold Produto nome:string descricao:text preco:decimal estoque:integer categoria

class Produto < ApplicationRecord
  has_many :itens
end


5. Pagamento:
   - Comanda (referência à comanda associada ao pagamento)
   - Método de pagamento (dinheiro, cartão, etc.)
   - Valor total pago
   - Troco (apenas para pagamento em dinheiro)
   - Data e hora do pagamento
rails g scaffold Pagamento comanda:references metodo_pagamento:string valor_total_pago:decimal troco:decimal data:date hora:time

class Pagamento < ApplicationRecord
  belongs_to :comanda
end
