require 'test_helper'

class InvoicingPartiesControllerTest < ActionController::TestCase
  setup do
    @invoicing_party = invoicing_parties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoicing_parties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoicing_party" do
    assert_difference('InvoicingParty.count') do
      post :create, :invoicing_party => @invoicing_party.attributes
    end

    assert_redirected_to invoicing_party_path(assigns(:invoicing_party))
  end

  test "should show invoicing_party" do
    get :show, :id => @invoicing_party.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @invoicing_party.to_param
    assert_response :success
  end

  test "should update invoicing_party" do
    put :update, :id => @invoicing_party.to_param, :invoicing_party => @invoicing_party.attributes
    assert_redirected_to invoicing_party_path(assigns(:invoicing_party))
  end

  test "should destroy invoicing_party" do
    assert_difference('InvoicingParty.count', -1) do
      delete :destroy, :id => @invoicing_party.to_param
    end

    assert_redirected_to invoicing_parties_path
  end
end
