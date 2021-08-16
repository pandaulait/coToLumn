require 'test_helper'

class Public::TextPatchOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_text_patch_orders_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_text_patch_orders_edit_url
    assert_response :success
  end

end
