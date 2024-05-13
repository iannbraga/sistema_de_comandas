class AddStatusToComandas < ActiveRecord::Migration[7.0]
  def change
    add_column :comandas, :status, :string
  end
end
