require 'test_helper'

class BodaControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get boda_home_url
    assert_response :success
  end

  test "should get help" do
    get boda_help_url
    assert_response :success
  end

end
