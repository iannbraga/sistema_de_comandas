# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_13_181035) do
  create_table "comandas", force: :cascade do |t|
    t.integer "numero"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "pedido_id", null: false
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.decimal "preco_unitario"
    t.decimal "subtotal"
    t.string "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_items_on_pedido_id"
    t.index ["produto_id"], name: "index_items_on_produto_id"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.integer "comanda_id", null: false
    t.string "metodo_pagamento"
    t.decimal "valor_total_pago"
    t.decimal "troco"
    t.date "data"
    t.time "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comanda_id"], name: "index_pagamentos_on_comanda_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "comanda_id", null: false
    t.date "data"
    t.time "hora"
    t.string "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comanda_id"], name: "index_pedidos_on_comanda_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.decimal "preco"
    t.integer "estoque"
    t.string "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "pedidos"
  add_foreign_key "items", "produtos"
  add_foreign_key "pagamentos", "comandas"
  add_foreign_key "pedidos", "comandas"
end
