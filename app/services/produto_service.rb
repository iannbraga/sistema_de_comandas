# app/services/produto_service.rb
class ProdutoService
  def initialize(produto_params)
    @produto_params = produto_params
  end

  def create
    Produto.create(@produto_params)
  end

  def update(produto, update_params)
    produto.update(update_params)
  end

  def destroy(produto)
    produto.destroy
  end
end
