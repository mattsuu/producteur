require 'test_helper'

class ReceiversControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get receivers_show_url
    assert_response :success
  end

end
