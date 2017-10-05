require 'test_helper'

class ActualRecipeReqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actual_recipe_req = actual_recipe_reqs(:one)
  end

  test "should get index" do
    get actual_recipe_reqs_url
    assert_response :success
  end

  test "should get new" do
    get new_actual_recipe_req_url
    assert_response :success
  end

  test "should create actual_recipe_req" do
    assert_difference('ActualRecipeReq.count') do
      post actual_recipe_reqs_url, params: { actual_recipe_req: { qty: @actual_recipe_req.qty, supply_list_id: @actual_recipe_req.supply_list_id, surgery_appt_id: @actual_recipe_req.surgery_appt_id } }
    end

    assert_redirected_to actual_recipe_req_url(ActualRecipeReq.last)
  end

  test "should show actual_recipe_req" do
    get actual_recipe_req_url(@actual_recipe_req)
    assert_response :success
  end

  test "should get edit" do
    get edit_actual_recipe_req_url(@actual_recipe_req)
    assert_response :success
  end

  test "should update actual_recipe_req" do
    patch actual_recipe_req_url(@actual_recipe_req), params: { actual_recipe_req: { qty: @actual_recipe_req.qty, supply_list_id: @actual_recipe_req.supply_list_id, surgery_appt_id: @actual_recipe_req.surgery_appt_id } }
    assert_redirected_to actual_recipe_req_url(@actual_recipe_req)
  end

  test "should destroy actual_recipe_req" do
    assert_difference('ActualRecipeReq.count', -1) do
      delete actual_recipe_req_url(@actual_recipe_req)
    end

    assert_redirected_to actual_recipe_reqs_url
  end
end
