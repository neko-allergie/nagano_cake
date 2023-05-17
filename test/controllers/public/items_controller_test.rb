require "test_helper"

class Public::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_items_new_url
    assert_response :success
  end

  test "should get create" do
    get public_items_create_url
    assert_response :success
  end
end
