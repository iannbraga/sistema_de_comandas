class CreateMovimentacaoEstoques < ActiveRecord::Migration[7.0]
  def change
    create_table :movimentacao_estoques do |t|
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade, null: false, default: 0
      t.string :motivo, default: ""
      t.string :observacao
      t.date :data
      t.time :hora

      t.timestamps
    end
  end
end
