require 'test_helper'

class Public::LiteraturesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get public_literatures_index_url
    assert_response :success
  end
end
