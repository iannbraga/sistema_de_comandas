class Comanda < ApplicationRecord
  has_many :pedidos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy

  def atualizar_total
    total_comanda = pedidos.sum(:total)
    update(total: total_comanda)
  end
end
