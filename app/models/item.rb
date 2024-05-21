class Item < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :produto, optional: true

  def preco_unitario
    sprintf('%.2f', self[:preco_unitario])
  end
  
end
