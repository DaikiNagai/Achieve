require 'test_helper'

class ConvertionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get convertions_index_url
    assert_response :success
  end

  test "should get create" do
    get convertions_create_url
    assert_response :success
  end

end
