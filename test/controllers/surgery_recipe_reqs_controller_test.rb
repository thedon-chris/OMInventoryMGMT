require 'test_helper'

class SurgeryRecipeReqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @surgery_recipe_req = surgery_recipe_reqs(:one)
  end

  test "should get index" do
    get surgery_recipe_reqs_url
    assert_response :success
  end

  test "should get new" do
    get new_surgery_recipe_req_url
    assert_response :success
  end

  test "should create surgery_recipe_req" do
    assert_difference('SurgeryRecipeReq.count') do
      post surgery_recipe_reqs_url, params: { surgery_recipe_req: { qty: @surgery_recipe_req.qty, supply_list_id: @surgery_recipe_req.supply_list_id, surgery_type_id: @surgery_recipe_req.surgery_type_id } }
    end

    assert_redirected_to surgery_recipe_req_url(SurgeryRecipeReq.last)
  end

  test "should show surgery_recipe_req" do
    get surgery_recipe_req_url(@surgery_recipe_req)
    assert_response :success
  end

  test "should get edit" do
    get edit_surgery_recipe_req_url(@surgery_recipe_req)
    assert_response :success
  end

  test "should update surgery_recipe_req" do
    patch surgery_recipe_req_url(@surgery_recipe_req), params: { surgery_recipe_req: { qty: @surgery_recipe_req.qty, supply_list_id: @surgery_recipe_req.supply_list_id, surgery_type_id: @surgery_recipe_req.surgery_type_id } }
    assert_redirected_to surgery_recipe_req_url(@surgery_recipe_req)
  end

  test "should destroy surgery_recipe_req" do
    assert_difference('SurgeryRecipeReq.count', -1) do
      delete surgery_recipe_req_url(@surgery_recipe_req)
    end

    assert_redirected_to surgery_recipe_reqs_url
  end
end
