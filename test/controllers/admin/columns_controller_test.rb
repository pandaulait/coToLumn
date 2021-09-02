require 'test_helper'

class Admin::ColumnsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_columns_index_url
    assert_response :success
  end
end
