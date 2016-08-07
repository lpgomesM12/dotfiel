require 'test_helper'

class PontoclientesControllerTest < ActionController::TestCase
  setup do
    @pontocliente = pontoclientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pontoclientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pontocliente" do
    assert_difference('Pontocliente.count') do
      post :create, pontocliente: { clienteempresa_id: @pontocliente.clienteempresa_id, desc_ponto: @pontocliente.desc_ponto, desc_ponto: @pontocliente.desc_ponto, empresa_id: @pontocliente.empresa_id, flag_resgatado: @pontocliente.flag_resgatado, flag_resgatado: @pontocliente.flag_resgatado, numr_ponto: @pontocliente.numr_ponto, regraponto_id: @pontocliente.regraponto_id, valor_gasto: @pontocliente.valor_gasto }
    end

    assert_redirected_to pontocliente_path(assigns(:pontocliente))
  end

  test "should show pontocliente" do
    get :show, id: @pontocliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pontocliente
    assert_response :success
  end

  test "should update pontocliente" do
    patch :update, id: @pontocliente, pontocliente: { clienteempresa_id: @pontocliente.clienteempresa_id, desc_ponto: @pontocliente.desc_ponto, desc_ponto: @pontocliente.desc_ponto, empresa_id: @pontocliente.empresa_id, flag_resgatado: @pontocliente.flag_resgatado, flag_resgatado: @pontocliente.flag_resgatado, numr_ponto: @pontocliente.numr_ponto, regraponto_id: @pontocliente.regraponto_id, valor_gasto: @pontocliente.valor_gasto }
    assert_redirected_to pontocliente_path(assigns(:pontocliente))
  end

  test "should destroy pontocliente" do
    assert_difference('Pontocliente.count', -1) do
      delete :destroy, id: @pontocliente
    end

    assert_redirected_to pontoclientes_path
  end
end
