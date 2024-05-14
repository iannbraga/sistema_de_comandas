# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def dashboard
    # Agrupa os itens pelo produto_id e calcula a quantidade total e o total em reais para cada produto
    @itens_por_produto = Item.group(:produto_id)
      .select("produto_id, SUM(quantidade) AS quantidade_total, SUM(quantidade * preco_unitario) AS total_reais")
      .order(:produto_id)
      .to_json
  end
end
