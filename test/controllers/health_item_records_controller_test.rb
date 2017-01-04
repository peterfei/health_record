require 'test_helper'

class HealthItemRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_item_record = health_item_records(:one)
  end

  test "should get index" do
    get health_item_records_url
    assert_response :success
  end

  test "should get new" do
    get new_health_item_record_url
    assert_response :success
  end

  test "should create health_item_record" do
    assert_difference('HealthItemRecord.count') do
      post health_item_records_url, params: { health_item_record: {  } }
    end

    assert_redirected_to health_item_record_url(HealthItemRecord.last)
  end

  test "should show health_item_record" do
    get health_item_record_url(@health_item_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_item_record_url(@health_item_record)
    assert_response :success
  end

  test "should update health_item_record" do
    patch health_item_record_url(@health_item_record), params: { health_item_record: {  } }
    assert_redirected_to health_item_record_url(@health_item_record)
  end

  test "should destroy health_item_record" do
    assert_difference('HealthItemRecord.count', -1) do
      delete health_item_record_url(@health_item_record)
    end

    assert_redirected_to health_item_records_url
  end
end
