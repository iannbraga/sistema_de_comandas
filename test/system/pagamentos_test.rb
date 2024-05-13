require "application_system_test_case"

class PagamentosTest < ApplicationSystemTestCase
  setup do
    @pagamento = pagamentos(:one)
  end

  test "visiting the index" do
    visit pagamentos_url
    assert_selector "h1", text: "Pagamentos"
  end

  test "should create pagamento" do
    visit pagamentos_url
    click_on "New pagamento"

    fill_in "Comanda", with: @pagamento.comanda_id
    fill_in "Data", with: @pagamento.data
    fill_in "Hora", with: @pagamento.hora
    fill_in "Metodo pagamento", with: @pagamento.metodo_pagamento
    fill_in "Troco", with: @pagamento.troco
    fill_in "Valor total pago", with: @pagamento.valor_total_pago
    click_on "Create Pagamento"

    assert_text "Pagamento was successfully created"
    click_on "Back"
  end

  test "should update Pagamento" do
    visit pagamento_url(@pagamento)
    click_on "Edit this pagamento", match: :first

    fill_in "Comanda", with: @pagamento.comanda_id
    fill_in "Data", with: @pagamento.data
    fill_in "Hora", with: @pagamento.hora
    fill_in "Metodo pagamento", with: @pagamento.metodo_pagamento
    fill_in "Troco", with: @pagamento.troco
    fill_in "Valor total pago", with: @pagamento.valor_total_pago
    click_on "Update Pagamento"

    assert_text "Pagamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Pagamento" do
    visit pagamento_url(@pagamento)
    click_on "Destroy this pagamento", match: :first

    assert_text "Pagamento was successfully destroyed"
  end
end
