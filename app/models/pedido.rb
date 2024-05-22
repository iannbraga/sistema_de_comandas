class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens, dependent: :destroy

  accepts_nested_attributes_for :itens, allow_destroy: true

  before_save :calcular_total
  after_save :atualizar_total_comanda

  def calcular_total
    itens.sum(:subtotal)
  end

  private

  def atualizar_total_comanda
    comanda.atualizar_total
  end

end
