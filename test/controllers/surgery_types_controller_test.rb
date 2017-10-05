require 'test_helper'

class SurgeryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @surgery_type = surgery_types(:one)
  end

  test "should get index" do
    get surgery_types_url
    assert_response :success
  end

  test "should get new" do
    get new_surgery_type_url
    assert_response :success
  end

  test "should create surgery_type" do
    assert_difference('SurgeryType.count') do
      post surgery_types_url, params: { surgery_type: { surgery_name: @surgery_type.surgery_name } }
    end

    assert_redirected_to surgery_type_url(SurgeryType.last)
  end

  test "should show surgery_type" do
    get surgery_type_url(@surgery_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_surgery_type_url(@surgery_type)
    assert_response :success
  end

  test "should update surgery_type" do
    patch surgery_type_url(@surgery_type), params: { surgery_type: { surgery_name: @surgery_type.surgery_name } }
    assert_redirected_to surgery_type_url(@surgery_type)
  end

  test "should destroy surgery_type" do
    assert_difference('SurgeryType.count', -1) do
      delete surgery_type_url(@surgery_type)
    end

    assert_redirected_to surgery_types_url
  end
end
