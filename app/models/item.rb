class Item < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :produto, optional: true

  validates :produto_id, :quantidade, :preco_unitario, presence: true
  validate :estoque_suficiente

  before_save :calcular_subtotal, :atualizar_estoque

  def calcular_subtotal
    self.subtotal = preco_unitario.to_f * quantidade
  end

  private

  def estoque_suficiente
    if produto.estoque < quantidade
      errors.add(:quantidade, "não pode ser maior que o estoque disponível")
    end
  end

  def atualizar_estoque
    produto.update(estoque: produto.estoque - quantidade)
  end
end
