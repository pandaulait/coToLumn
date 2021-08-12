require 'test_helper'

class Public::PatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_patches_index_url
    assert_response :success
  end

  test "should get show" do
    get public_patches_show_url
    assert_response :success
  end

  test "should get new" do
    get public_patches_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_patches_edit_url
    assert_response :success
  end

end
