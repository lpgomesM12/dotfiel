require 'test_helper'

class RegrapontosControllerTest < ActionController::TestCase
  setup do
    @regraponto = regrapontos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regrapontos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regraponto" do
    assert_difference('Regraponto.count') do
      post :create, regraponto: { nome_regra: @regraponto.nome_regra }
    end

    assert_redirected_to regraponto_path(assigns(:regraponto))
  end

  test "should show regraponto" do
    get :show, id: @regraponto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regraponto
    assert_response :success
  end

  test "should update regraponto" do
    patch :update, id: @regraponto, regraponto: { nome_regra: @regraponto.nome_regra }
    assert_redirected_to regraponto_path(assigns(:regraponto))
  end

  test "should destroy regraponto" do
    assert_difference('Regraponto.count', -1) do
      delete :destroy, id: @regraponto
    end

    assert_redirected_to regrapontos_path
  end
end
