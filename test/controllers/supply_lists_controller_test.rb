require 'test_helper'

class SupplyListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supply_list = supply_lists(:one)
  end

  test "should get index" do
    get supply_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_supply_list_url
    assert_response :success
  end

  test "should create supply_list" do
    assert_difference('SupplyList.count') do
      post supply_lists_url, params: { supply_list: { item_name: @supply_list.item_name } }
    end

    assert_redirected_to supply_list_url(SupplyList.last)
  end

  test "should show supply_list" do
    get supply_list_url(@supply_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_supply_list_url(@supply_list)
    assert_response :success
  end

  test "should update supply_list" do
    patch supply_list_url(@supply_list), params: { supply_list: { item_name: @supply_list.item_name } }
    assert_redirected_to supply_list_url(@supply_list)
  end

  test "should destroy supply_list" do
    assert_difference('SupplyList.count', -1) do
      delete supply_list_url(@supply_list)
    end

    assert_redirected_to supply_lists_url
  end
end
