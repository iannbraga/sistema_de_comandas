class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens
  accepts_nested_attributes_for :itens, allow_destroy: true
end
