class ComandaService
  def initialize(comanda_params)
    @comanda_params = comanda_params
  end

  def create_comanda
    Comanda.new(@comanda_params)
  end

  def update_comanda(comanda, comanda_params)
    comanda.update(comanda_params)
  end

  def destroy_comanda(comanda)
    comanda.destroy
  end

  def calcular_total(comanda)
    total = comanda.pedidos.sum(:total)
    comanda.update(total: total)
  end
end
