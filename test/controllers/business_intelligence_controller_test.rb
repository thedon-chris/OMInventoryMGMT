require 'test_helper'

class BusinessIntelligenceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get business_intelligence_index_url
    assert_response :success
  end

  test "should get donut_graph" do
    get business_intelligence_donut_graph_url
    assert_response :success
  end

  test "should get line_graph" do
    get business_intelligence_line_graph_url
    assert_response :success
  end

  test "should get bar_graph" do
    get business_intelligence_bar_graph_url
    assert_response :success
  end

end
