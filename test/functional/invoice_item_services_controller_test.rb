require 'test_helper'

class InvoiceItemServicesControllerTest < ActionController::TestCase
  setup do
    @invoice_item_service = invoice_item_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_item_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_item_service" do
    assert_difference('InvoiceItemService.count') do
      post :create, :invoice_item_service => @invoice_item_service.attributes
    end

    assert_redirected_to invoice_item_service_path(assigns(:invoice_item_service))
  end

  test "should show invoice_item_service" do
    get :show, :id => @invoice_item_service.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @invoice_item_service.to_param
    assert_response :success
  end

  test "should update invoice_item_service" do
    put :update, :id => @invoice_item_service.to_param, :invoice_item_service => @invoice_item_service.attributes
    assert_redirected_to invoice_item_service_path(assigns(:invoice_item_service))
  end

  test "should destroy invoice_item_service" do
    assert_difference('InvoiceItemService.count', -1) do
      delete :destroy, :id => @invoice_item_service.to_param
    end

    assert_redirected_to invoice_item_services_path
  end
end
