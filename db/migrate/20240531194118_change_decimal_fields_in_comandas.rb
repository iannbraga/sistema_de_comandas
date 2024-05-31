class ChangeDecimalFieldsInComandas < ActiveRecord::Migration[7.0]
  def change
    change_column :comandas, :total, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
