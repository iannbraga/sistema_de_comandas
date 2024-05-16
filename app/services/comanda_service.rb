class ComandaService
  def initialize(comanda_params)
    @comanda_params = comanda_params
  end

  def create_comanda
    comanda = Comanda.new(@comanda_params)

    comanda.total = 0.0
    comanda.status = "Livre"

    if comanda.save
      comanda
    else
      nil
    end
  end

  def update_comanda(comanda, comanda_params)
    if comanda.update(comanda_params)
      comanda
    else
      nil
    end
  end

  # TODO
  def update_status(comanda)
    if comanda.pedidos.exists?
      comanda.update(status: 'Ocupado')
    else
      comanda.update(status: 'Livre')
    end
  end

  def destroy_comanda(comanda)
    comanda.destroy
  end
end
