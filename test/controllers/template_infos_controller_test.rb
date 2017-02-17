require 'test_helper'

class TemplateInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @template_info = template_infos(:one)
  end

  test "should get index" do
    get template_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_template_info_url
    assert_response :success
  end

  test "should create template_info" do
    assert_difference('TemplateInfo.count') do
      post template_infos_url, params: { template_info: {  } }
    end

    assert_redirected_to template_info_url(TemplateInfo.last)
  end

  test "should show template_info" do
    get template_info_url(@template_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_template_info_url(@template_info)
    assert_response :success
  end

  test "should update template_info" do
    patch template_info_url(@template_info), params: { template_info: {  } }
    assert_redirected_to template_info_url(@template_info)
  end

  test "should destroy template_info" do
    assert_difference('TemplateInfo.count', -1) do
      delete template_info_url(@template_info)
    end

    assert_redirected_to template_infos_url
  end
end
