require 'test_helper'

class HealthItemAttentionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_item_attention = health_item_attentions(:one)
  end

  test "should get index" do
    get health_item_attentions_url
    assert_response :success
  end

  test "should get new" do
    get new_health_item_attention_url
    assert_response :success
  end

  test "should create health_item_attention" do
    assert_difference('HealthItemAttention.count') do
      post health_item_attentions_url, params: { health_item_attention: {  } }
    end

    assert_redirected_to health_item_attention_url(HealthItemAttention.last)
  end

  test "should show health_item_attention" do
    get health_item_attention_url(@health_item_attention)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_item_attention_url(@health_item_attention)
    assert_response :success
  end

  test "should update health_item_attention" do
    patch health_item_attention_url(@health_item_attention), params: { health_item_attention: {  } }
    assert_redirected_to health_item_attention_url(@health_item_attention)
  end

  test "should destroy health_item_attention" do
    assert_difference('HealthItemAttention.count', -1) do
      delete health_item_attention_url(@health_item_attention)
    end

    assert_redirected_to health_item_attentions_url
  end
end
