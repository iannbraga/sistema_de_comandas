class ChangeDecimalFieldsInPagamentos < ActiveRecord::Migration[7.0]
  def change
    change_column :pagamentos, :valor_total_pago, :decimal, precision: 10, scale: 2, default: 0.00
    change_column :pagamentos, :troco, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
