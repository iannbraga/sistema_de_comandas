class Produto < ApplicationRecord
  validates :nome, :preco, :estoque, :categoria, presence: true

  def total
    sprintf("%.2f", self[:preco])
  end

  def aumentar_estoque(quantidade)
    novo_estoque = self.estoque + quantidade
    update(estoque: novo_estoque)
  end

  def diminuir_estoque(quantidade)
    novo_estoque = self.estoque - quantidade
    if novo_estoque < 0
      errors.add(:estoque, "não pode ser negativo")
      return false
    else
      update(estoque: novo_estoque)
      return true
    end
  end
end
