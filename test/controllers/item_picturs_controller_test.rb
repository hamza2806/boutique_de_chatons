require 'test_helper'

class ItemPictursControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get item_picturs_create_url
    assert_response :success
  end

end
