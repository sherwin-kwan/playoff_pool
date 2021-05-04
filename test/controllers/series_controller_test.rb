require 'test_helper'

class SeriesControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get series_all_url
    assert_response :success
  end

end
