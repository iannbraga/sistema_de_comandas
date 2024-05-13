class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens
end
