require 'test_helper'

class HealthItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_item = health_items(:one)
  end

  test "should get index" do
    get health_items_url
    assert_response :success
  end

  test "should get new" do
    get new_health_item_url
    assert_response :success
  end

  test "should create health_item" do
    assert_difference('HealthItem.count') do
      post health_items_url, params: { health_item: {  } }
    end

    assert_redirected_to health_item_url(HealthItem.last)
  end

  test "should show health_item" do
    get health_item_url(@health_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_item_url(@health_item)
    assert_response :success
  end

  test "should update health_item" do
    patch health_item_url(@health_item), params: { health_item: {  } }
    assert_redirected_to health_item_url(@health_item)
  end

  test "should destroy health_item" do
    assert_difference('HealthItem.count', -1) do
      delete health_item_url(@health_item)
    end

    assert_redirected_to health_items_url
  end
end
