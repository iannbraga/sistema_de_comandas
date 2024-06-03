class MovimentacaoEstoque < ApplicationRecord
  belongs_to :produto

  validates :quantidade, :motivo, presence: true
  validates :quantidade, numericality: { greater_than: 0 }

  after_create :atualizar_estoque_produto

  private

  def atualizar_estoque_produto
    produto.aumentar_estoque(quantidade)
  end
end
