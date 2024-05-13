require "application_system_test_case"

class ComandasTest < ApplicationSystemTestCase
  setup do
    @comanda = comandas(:one)
  end

  test "visiting the index" do
    visit comandas_url
    assert_selector "h1", text: "Comandas"
  end

  test "should create comanda" do
    visit comandas_url
    click_on "New comanda"

    fill_in "Numero", with: @comanda.numero
    fill_in "Total", with: @comanda.total
    click_on "Create Comanda"

    assert_text "Comanda was successfully created"
    click_on "Back"
  end

  test "should update Comanda" do
    visit comanda_url(@comanda)
    click_on "Edit this comanda", match: :first

    fill_in "Numero", with: @comanda.numero
    fill_in "Total", with: @comanda.total
    click_on "Update Comanda"

    assert_text "Comanda was successfully updated"
    click_on "Back"
  end

  test "should destroy Comanda" do
    visit comanda_url(@comanda)
    click_on "Destroy this comanda", match: :first

    assert_text "Comanda was successfully destroyed"
  end
end
