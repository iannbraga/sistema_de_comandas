require "application_system_test_case"

class ItensTest < ApplicationSystemTestCase
  setup do
    @item = itens(:one)
  end

  test "visiting the index" do
    visit itens_url
    assert_selector "h1", text: "Itens"
  end

  test "should create item" do
    visit itens_url
    click_on "New item"

    fill_in "Observacoes", with: @item.observacoes
    fill_in "Pedido", with: @item.pedido_id
    fill_in "Preco unitario", with: @item.preco_unitario
    fill_in "Produto", with: @item.produto_id
    fill_in "Quantidade", with: @item.quantidade
    fill_in "Subtotal", with: @item.subtotal
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Observacoes", with: @item.observacoes
    fill_in "Pedido", with: @item.pedido_id
    fill_in "Preco unitario", with: @item.preco_unitario
    fill_in "Produto", with: @item.produto_id
    fill_in "Quantidade", with: @item.quantidade
    fill_in "Subtotal", with: @item.subtotal
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
