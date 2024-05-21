class Produto < ApplicationRecord
  def total
    sprintf("%.2f", self[:preco])
  end
end
