class CreateComandas < ActiveRecord::Migration[7.0]
  def change
    create_table :comandas do |t|
      t.integer :numero
      t.decimal :total

      t.timestamps
    end
  end
end
