require 'test_helper'

class TalkroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get talkrooms_show_url
    assert_response :success
  end

end
