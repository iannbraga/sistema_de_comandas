class Pagamento < ApplicationRecord
  belongs_to :comanda

  def valor_total_pago
    sprintf('%.2f', self[:valor_total_pago])
  end
end
