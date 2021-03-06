require 'test_helper'

class Public::ColumnsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get public_columns_index_url
    assert_response :success
  end

  test 'should get show' do
    get public_columns_show_url
    assert_response :success
  end

  test 'should get edit' do
    get public_columns_edit_url
    assert_response :success
  end

  test 'should get new' do
    get public_columns_new_url
    assert_response :success
  end
end
