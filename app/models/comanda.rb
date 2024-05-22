class Comanda < ApplicationRecord
  has_many :pedidos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy

  def total
    sprintf('%.2f', self[:total])
  end

  def atualizar_status
    if pedidos.size > 0
      update(status:'Ocupada')
    else      
      update(status:'Livre')
    end
  end

  validates :numero, presence: true, uniqueness: true

  def atualizar_total
    self.total = pedidos.sum(:total)
    save
  end
end
