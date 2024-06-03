class Item < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :produto, optional: true

  validates :produto_id, :quantidade, :preco_unitario, presence: true
  validate :estoque_suficiente

  before_save :calcular_subtotal
  after_save :atualizar_estoque
  before_destroy :repor_estoque

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
    unless produto.diminuir_estoque(quantidade)
      errors.add(:produto, "estoque insuficiente para a quantidade solicitada")
      throw(:abort) # Impede que o registro seja salvo se o estoque não for suficiente
    end
  end

  def repor_estoque
    produto.aumentar_estoque(quantidade)
  end
end
