ActiveRecord::Schema[7.0].define(version: 2024_06_03_201504) do
  create_table "comandas", force: :cascade do |t|
    t.integer "numero"
    t.string "nome", default: ""
    t.string "status", default: "Livre"
    t.decimal "total", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens", force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "produto_id", null: false
    t.integer "quantidade", default: 1
    t.decimal "preco_unitario", precision: 10, scale: 2, default: "0.0"
    t.decimal "subtotal", precision: 10, scale: 2, default: "0.0"
    t.string "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venda_id"
    t.index ["pedido_id"], name: "index_itens_on_pedido_id"
    t.index ["produto_id"], name: "index_itens_on_produto_id"
    t.index ["venda_id"], name: "index_itens_on_venda_id"
  end

  create_table "movimentacao_estoques", force: :cascade do |t|
    t.integer "produto_id", null: false
    t.integer "quantidade", default: 0, null: false
    t.string "motivo", default: ""
    t.string "observacao"
    t.date "data"
    t.time "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_movimentacao_estoques_on_produto_id"
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
    t.decimal "total", precision: 10, scale: 2, default: "0.0"
    t.string "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "finalizado", default: false
    t.index ["comanda_id"], name: "index_pedidos_on_comanda_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco", precision: 10, scale: 2, default: "0.0"
    t.integer "estoque"
    t.string "categoria"
    t.string "icone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendas", force: :cascade do |t|
    t.date "data"
    t.time "hora"
    t.string "cliente"
    t.string "status"
    t.decimal "total", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "itens", "pedidos"
  add_foreign_key "itens", "produtos"
  add_foreign_key "itens", "vendas"
  add_foreign_key "movimentacao_estoques", "produtos"
  add_foreign_key "pagamentos", "comandas"
  add_foreign_key "pedidos", "comandas"
end
