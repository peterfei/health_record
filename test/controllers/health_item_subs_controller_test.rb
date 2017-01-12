require 'test_helper'

class HealthItemSubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_item_sub = health_item_subs(:one)
  end

  test "should get index" do
    get health_item_subs_url
    assert_response :success
  end

  test "should get new" do
    get new_health_item_sub_url
    assert_response :success
  end

  test "should create health_item_sub" do
    assert_difference('HealthItemSub.count') do
      post health_item_subs_url, params: { health_item_sub: {  } }
    end

    assert_redirected_to health_item_sub_url(HealthItemSub.last)
  end

  test "should show health_item_sub" do
    get health_item_sub_url(@health_item_sub)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_item_sub_url(@health_item_sub)
    assert_response :success
  end

  test "should update health_item_sub" do
    patch health_item_sub_url(@health_item_sub), params: { health_item_sub: {  } }
    assert_redirected_to health_item_sub_url(@health_item_sub)
  end

  test "should destroy health_item_sub" do
    assert_difference('HealthItemSub.count', -1) do
      delete health_item_sub_url(@health_item_sub)
    end

    assert_redirected_to health_item_subs_url
  end
end
