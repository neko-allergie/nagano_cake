require "test_helper"

class Public::DeliAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deli_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_deli_addresses_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_deli_addresses_create_url
    assert_response :success
  end

  test "should get update" do
    get public_deli_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_deli_addresses_destroy_url
    assert_response :success
  end
end
