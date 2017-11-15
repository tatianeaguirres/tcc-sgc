require 'test_helper'

class ProdutoOrcamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto_orcamento = produto_orcamentos(:one)
  end

  test "should get index" do
    get produto_orcamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_orcamento_url
    assert_response :success
  end

  test "should create produto_orcamento" do
    assert_difference('ProdutoOrcamento.count') do
      post produto_orcamentos_url, params: { produto_orcamento: { orcamento_id: @produto_orcamento.orcamento_id, produto_id: @produto_orcamento.produto_id } }
    end

    assert_redirected_to produto_orcamento_url(ProdutoOrcamento.last)
  end

  test "should show produto_orcamento" do
    get produto_orcamento_url(@produto_orcamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_orcamento_url(@produto_orcamento)
    assert_response :success
  end

  test "should update produto_orcamento" do
    patch produto_orcamento_url(@produto_orcamento), params: { produto_orcamento: { orcamento_id: @produto_orcamento.orcamento_id, produto_id: @produto_orcamento.produto_id } }
    assert_redirected_to produto_orcamento_url(@produto_orcamento)
  end

  test "should destroy produto_orcamento" do
    assert_difference('ProdutoOrcamento.count', -1) do
      delete produto_orcamento_url(@produto_orcamento)
    end

    assert_redirected_to produto_orcamentos_url
  end
end
