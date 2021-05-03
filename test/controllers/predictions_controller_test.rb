require 'test_helper'

class PredictionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get predictions_new_url
    assert_response :success
  end

end
