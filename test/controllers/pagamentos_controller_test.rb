require "test_helper"

class PagamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pagamento = pagamentos(:one)
  end

  test "should get index" do
    get pagamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_pagamento_url
    assert_response :success
  end

  test "should create pagamento" do
    assert_difference("Pagamento.count") do
      post pagamentos_url, params: { pagamento: { comanda_id: @pagamento.comanda_id, data: @pagamento.data, hora: @pagamento.hora, metodo_pagamento: @pagamento.metodo_pagamento, troco: @pagamento.troco, valor_total_pago: @pagamento.valor_total_pago } }
    end

    assert_redirected_to pagamento_url(Pagamento.last)
  end

  test "should show pagamento" do
    get pagamento_url(@pagamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_pagamento_url(@pagamento)
    assert_response :success
  end

  test "should update pagamento" do
    patch pagamento_url(@pagamento), params: { pagamento: { comanda_id: @pagamento.comanda_id, data: @pagamento.data, hora: @pagamento.hora, metodo_pagamento: @pagamento.metodo_pagamento, troco: @pagamento.troco, valor_total_pago: @pagamento.valor_total_pago } }
    assert_redirected_to pagamento_url(@pagamento)
  end

  test "should destroy pagamento" do
    assert_difference("Pagamento.count", -1) do
      delete pagamento_url(@pagamento)
    end

    assert_redirected_to pagamentos_url
  end
end
