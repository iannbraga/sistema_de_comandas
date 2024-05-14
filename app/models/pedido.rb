class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens, dependent: :destroy

  accepts_nested_attributes_for :itens, allow_destroy: true

  def total
    itens.sum(&:subtotal)
  end
end
