class Pedido < ApplicationRecord
  belongs_to :comanda
  has_many :itens, dependent: :destroy

  accepts_nested_attributes_for :itens, allow_destroy: true

  before_save :calcular_total
  after_save :atualizar_total_comanda_adicionado, :atualizar_status_comanda
  after_destroy :atualizar_total_comanda_removido, :atualizar_status_comanda
  after_update :atualizar_total_comanda_pagar, if: :saved_change_to_finalizado?

  def calcular_total
    total = itens.sum(:subtotal)
  end

  private

  def atualizar_total_comanda_adicionado
    comanda.atualizar_total
  end

  def atualizar_total_comanda_removido
    comanda.atualizar_total
  end

  def atualizar_total_comanda_pagar
    comanda.atualizar_total
  end

  def atualizar_status_comanda
    comanda.atualizar_status
  end
end
