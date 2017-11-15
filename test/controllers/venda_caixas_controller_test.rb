require 'test_helper'

class VendaCaixasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venda_caixa = venda_caixas(:one)
  end

  test "should get index" do
    get venda_caixas_url
    assert_response :success
  end

  test "should get new" do
    get new_venda_caixa_url
    assert_response :success
  end

  test "should create venda_caixa" do
    assert_difference('VendaCaixa.count') do
      post venda_caixas_url, params: { venda_caixa: { caixa_id: @venda_caixa.caixa_id, venda_id: @venda_caixa.venda_id } }
    end

    assert_redirected_to venda_caixa_url(VendaCaixa.last)
  end

  test "should show venda_caixa" do
    get venda_caixa_url(@venda_caixa)
    assert_response :success
  end

  test "should get edit" do
    get edit_venda_caixa_url(@venda_caixa)
    assert_response :success
  end

  test "should update venda_caixa" do
    patch venda_caixa_url(@venda_caixa), params: { venda_caixa: { caixa_id: @venda_caixa.caixa_id, venda_id: @venda_caixa.venda_id } }
    assert_redirected_to venda_caixa_url(@venda_caixa)
  end

  test "should destroy venda_caixa" do
    assert_difference('VendaCaixa.count', -1) do
      delete venda_caixa_url(@venda_caixa)
    end

    assert_redirected_to venda_caixas_url
  end
end
