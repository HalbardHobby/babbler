require "test_helper"

class BabblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @babble = babbles(:one)
  end

  test "should get index" do
    get babbles_url
    assert_response :success
  end

  test "should get new" do
    get new_babble_url
    assert_response :success
  end

  test "should create babble" do
    assert_difference('Babble.count') do
      post babbles_url, params: { babble: { content: @babble.content, expires_at: @babble.expires_at, user_id: @babble.user_id } }
    end

    assert_redirected_to babble_url(Babble.last)
  end

  test "should show babble" do
    get babble_url(@babble)
    assert_response :success
  end

  test "should get edit" do
    get edit_babble_url(@babble)
    assert_response :success
  end

  test "should update babble" do
    patch babble_url(@babble), params: { babble: { content: @babble.content, expires_at: @babble.expires_at, user_id: @babble.user_id } }
    assert_redirected_to babble_url(@babble)
  end

  test "should destroy babble" do
    assert_difference('Babble.count', -1) do
      delete babble_url(@babble)
    end

    assert_redirected_to babbles_url
  end
end
