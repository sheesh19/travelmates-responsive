require 'test_helper'

class EventFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get event_favorites_destroy_url
    assert_response :success
  end

end
