module ApplicationHelper
  def valor_com_duas_casas(valor)
    sprintf("%.2f", valor)
  end
end
