require 'test_helper'

class Admin::PatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_patches_index_url
    assert_response :success
  end

end
