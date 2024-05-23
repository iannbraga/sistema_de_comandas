class Comanda < ApplicationRecord
  has_many :pedidos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy

  validates :numero, presence: { message: "O número da comanda é obrigatório" }
  validates :numero, uniqueness: { message: "Já existe uma comanda com esse número" }

  def atualizar_status
    if pedidos.any? { |pedido| !pedido.finalizado }
      self.status = "Ocupada"
    else
      self.status = "Livre"
    end
    save
  end

  def atualizar_total
    self.total = pedidos.where(finalizado: false).sum(:total) # Considera todos os pedidos, tanto finalizados quanto não finalizados
    save
  end

  # Define os atributos permitidos para busca
  def self.ransackable_attributes(auth_object = nil)
    ["numero", "nome"]
  end

  # Se houver associações que você deseja permitir na busca, adicione-as
  def self.ransackable_associations(auth_object = nil)
    [""] # Exemplos, ajuste conforme necessário
  end
end
