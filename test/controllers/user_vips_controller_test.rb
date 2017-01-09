require 'test_helper'

class UserVipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_vip = user_vips(:one)
  end

  test "should get index" do
    get user_vips_url
    assert_response :success
  end

  test "should get new" do
    get new_user_vip_url
    assert_response :success
  end

  test "should create user_vip" do
    assert_difference('UserVip.count') do
      post user_vips_url, params: { user_vip: {  } }
    end

    assert_redirected_to user_vip_url(UserVip.last)
  end

  test "should show user_vip" do
    get user_vip_url(@user_vip)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_vip_url(@user_vip)
    assert_response :success
  end

  test "should update user_vip" do
    patch user_vip_url(@user_vip), params: { user_vip: {  } }
    assert_redirected_to user_vip_url(@user_vip)
  end

  test "should destroy user_vip" do
    assert_difference('UserVip.count', -1) do
      delete user_vip_url(@user_vip)
    end

    assert_redirected_to user_vips_url
  end
end
