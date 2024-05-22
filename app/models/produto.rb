class Produto < ApplicationRecord

  validates :nome, :preco, :estoque, :categoria, presence: true
  
  def total
    sprintf("%.2f", self[:preco])
  end
end
