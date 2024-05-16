class Comanda < ApplicationRecord
  has_many :pedidos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy

  def atualizar_status
    if pedidos.size > 0
      update(status:'Ocupada')
    else      
      update(status:'Livre')
    end
  end

  def atualizar_total
    total_comanda = pedidos.sum(:total)
    update(total: total_comanda)
  end
end
