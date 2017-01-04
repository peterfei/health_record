require 'test_helper'

class TakeMedicineAttentionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @take_medicine_attention = take_medicine_attentions(:one)
  end

  test "should get index" do
    get take_medicine_attentions_url
    assert_response :success
  end

  test "should get new" do
    get new_take_medicine_attention_url
    assert_response :success
  end

  test "should create take_medicine_attention" do
    assert_difference('TakeMedicineAttention.count') do
      post take_medicine_attentions_url, params: { take_medicine_attention: {  } }
    end

    assert_redirected_to take_medicine_attention_url(TakeMedicineAttention.last)
  end

  test "should show take_medicine_attention" do
    get take_medicine_attention_url(@take_medicine_attention)
    assert_response :success
  end

  test "should get edit" do
    get edit_take_medicine_attention_url(@take_medicine_attention)
    assert_response :success
  end

  test "should update take_medicine_attention" do
    patch take_medicine_attention_url(@take_medicine_attention), params: { take_medicine_attention: {  } }
    assert_redirected_to take_medicine_attention_url(@take_medicine_attention)
  end

  test "should destroy take_medicine_attention" do
    assert_difference('TakeMedicineAttention.count', -1) do
      delete take_medicine_attention_url(@take_medicine_attention)
    end

    assert_redirected_to take_medicine_attentions_url
  end
end
