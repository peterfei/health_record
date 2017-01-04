require 'test_helper'

class MedicalRecordManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_record_management = medical_record_managements(:one)
  end

  test "should get index" do
    get medical_record_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_record_management_url
    assert_response :success
  end

  test "should create medical_record_management" do
    assert_difference('MedicalRecordManagement.count') do
      post medical_record_managements_url, params: { medical_record_management: {  } }
    end

    assert_redirected_to medical_record_management_url(MedicalRecordManagement.last)
  end

  test "should show medical_record_management" do
    get medical_record_management_url(@medical_record_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_record_management_url(@medical_record_management)
    assert_response :success
  end

  test "should update medical_record_management" do
    patch medical_record_management_url(@medical_record_management), params: { medical_record_management: {  } }
    assert_redirected_to medical_record_management_url(@medical_record_management)
  end

  test "should destroy medical_record_management" do
    assert_difference('MedicalRecordManagement.count', -1) do
      delete medical_record_management_url(@medical_record_management)
    end

    assert_redirected_to medical_record_managements_url
  end
end
