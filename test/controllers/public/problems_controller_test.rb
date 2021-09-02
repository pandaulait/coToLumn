require 'test_helper'

class Public::ProblemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get public_problems_new_url
    assert_response :success
  end

  test 'should get show' do
    get public_problems_show_url
    assert_response :success
  end

  test 'should get index' do
    get public_problems_index_url
    assert_response :success
  end

  test 'should get edit' do
    get public_problems_edit_url
    assert_response :success
  end
end
