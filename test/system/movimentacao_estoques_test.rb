require "application_system_test_case"

class MovimentacaoEstoquesTest < ApplicationSystemTestCase
  setup do
    @movimentacao_estoque = movimentacao_estoques(:one)
  end

  test "visiting the index" do
    visit movimentacao_estoques_url
    assert_selector "h1", text: "Movimentacao estoques"
  end

  test "should create movimentacao estoque" do
    visit movimentacao_estoques_url
    click_on "New movimentacao estoque"

    fill_in "Data", with: @movimentacao_estoque.data
    fill_in "Hora", with: @movimentacao_estoque.hora
    fill_in "Motivo", with: @movimentacao_estoque.motivo
    fill_in "Observacao", with: @movimentacao_estoque.observacao
    fill_in "Produto", with: @movimentacao_estoque.produto_id
    fill_in "Quantidade", with: @movimentacao_estoque.quantidade
    click_on "Create Movimentacao estoque"

    assert_text "Movimentacao estoque was successfully created"
    click_on "Back"
  end

  test "should update Movimentacao estoque" do
    visit movimentacao_estoque_url(@movimentacao_estoque)
    click_on "Edit this movimentacao estoque", match: :first

    fill_in "Data", with: @movimentacao_estoque.data
    fill_in "Hora", with: @movimentacao_estoque.hora
    fill_in "Motivo", with: @movimentacao_estoque.motivo
    fill_in "Observacao", with: @movimentacao_estoque.observacao
    fill_in "Produto", with: @movimentacao_estoque.produto_id
    fill_in "Quantidade", with: @movimentacao_estoque.quantidade
    click_on "Update Movimentacao estoque"

    assert_text "Movimentacao estoque was successfully updated"
    click_on "Back"
  end

  test "should destroy Movimentacao estoque" do
    visit movimentacao_estoque_url(@movimentacao_estoque)
    click_on "Destroy this movimentacao estoque", match: :first

    assert_text "Movimentacao estoque was successfully destroyed"
  end
end
