require 'test_helper'

class TakeMedicineManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @take_medicine_management = take_medicine_managements(:one)
  end

  test "should get index" do
    get take_medicine_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_take_medicine_management_url
    assert_response :success
  end

  test "should create take_medicine_management" do
    assert_difference('TakeMedicineManagement.count') do
      post take_medicine_managements_url, params: { take_medicine_management: {  } }
    end

    assert_redirected_to take_medicine_management_url(TakeMedicineManagement.last)
  end

  test "should show take_medicine_management" do
    get take_medicine_management_url(@take_medicine_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_take_medicine_management_url(@take_medicine_management)
    assert_response :success
  end

  test "should update take_medicine_management" do
    patch take_medicine_management_url(@take_medicine_management), params: { take_medicine_management: {  } }
    assert_redirected_to take_medicine_management_url(@take_medicine_management)
  end

  test "should destroy take_medicine_management" do
    assert_difference('TakeMedicineManagement.count', -1) do
      delete take_medicine_management_url(@take_medicine_management)
    end

    assert_redirected_to take_medicine_managements_url
  end
end
