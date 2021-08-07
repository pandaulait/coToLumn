require 'test_helper'

class Public::TextsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_texts_index_url
    assert_response :success
  end

  test "should get show" do
    get public_texts_show_url
    assert_response :success
  end

  test "should get new" do
    get public_texts_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_texts_edit_url
    assert_response :success
  end

end
