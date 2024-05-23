class PagesController < ApplicationController
  def dashboard
    # Define o intervalo de tempo com base no parâmetro passado
    case params[:intervalo]
    when 'hoje'
      start_time = 6.hours.ago.beginning_of_day + 6.hours
      end_time = 1.day.from_now.beginning_of_day + 4.hours
    when 'semanal'
      start_time = Time.now.beginning_of_week + 6.hours
      end_time = Time.now.end_of_week + 1.day + 4.hours
    when 'mensal'
      start_time = Time.now.beginning_of_month + 6.hours
      end_time = Time.now.next_month.beginning_of_month + 4.hours
    when 'anual'
      start_time = Time.now.beginning_of_year + 6.hours
      end_time = Time.now.next_year.beginning_of_year + 4.hours
    else
      # Default para mostrar todos os itens se nenhum intervalo for selecionado
      start_time = Time.at(0)
      end_time = Time.now
    end

    # Filtra os itens com base no intervalo de tempo
    @itens_por_produto = Item.where(created_at: start_time..end_time)
      .group(:produto_id)
      .select("produto_id, SUM(quantidade) AS quantidade_total, SUM(quantidade * preco_unitario) AS total_reais")
      .order(:created_at)

    # Obtém os estoques disponíveis de cada produto
    @estoques_por_produto = Produto.all.pluck(:id, :estoque).to_h
  end
end
