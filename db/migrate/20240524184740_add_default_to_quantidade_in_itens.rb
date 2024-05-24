class AddDefaultToQuantidadeInItens < ActiveRecord::Migration[7.0]
  def change
    change_column_default :itens, :quantidade, 1
  end
end
