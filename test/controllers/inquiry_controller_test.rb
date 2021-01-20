require 'test_helper'

class InquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inquiry_new_url
    assert_response :success
  end

end
