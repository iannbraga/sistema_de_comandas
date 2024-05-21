module ComandasHelper
  def status_comanda(status)
    if status.eql?("Livre")
      "bg-success"
    elsif status.eql?("Ocupada")
      "bg-danger"
    end
  end
end
