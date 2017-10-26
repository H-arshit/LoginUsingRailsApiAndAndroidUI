require 'test_helper'

class AppFunctionalityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get app_functionality_index_url
    assert_response :success
  end

end
