require 'test_helper'

class SurgeryApptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @surgery_appt = surgery_appts(:one)
  end

  test "should get index" do
    get surgery_appts_url
    assert_response :success
  end

  test "should get new" do
    get new_surgery_appt_url
    assert_response :success
  end

  test "should create surgery_appt" do
    assert_difference('SurgeryAppt.count') do
      post surgery_appts_url, params: { surgery_appt: { clinic_id: @surgery_appt.clinic_id, surgery_date: @surgery_appt.surgery_date, surgery_type_id: @surgery_appt.surgery_type_id } }
    end

    assert_redirected_to surgery_appt_url(SurgeryAppt.last)
  end

  test "should show surgery_appt" do
    get surgery_appt_url(@surgery_appt)
    assert_response :success
  end

  test "should get edit" do
    get edit_surgery_appt_url(@surgery_appt)
    assert_response :success
  end

  test "should update surgery_appt" do
    patch surgery_appt_url(@surgery_appt), params: { surgery_appt: { clinic_id: @surgery_appt.clinic_id, surgery_date: @surgery_appt.surgery_date, surgery_type_id: @surgery_appt.surgery_type_id } }
    assert_redirected_to surgery_appt_url(@surgery_appt)
  end

  test "should destroy surgery_appt" do
    assert_difference('SurgeryAppt.count', -1) do
      delete surgery_appt_url(@surgery_appt)
    end

    assert_redirected_to surgery_appts_url
  end
end
