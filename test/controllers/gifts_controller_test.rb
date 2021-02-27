require 'test_helper'

class GiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gifts_index_url
    assert_response :success
  end


  # test "the truth" do
  #   assert true
  # end

end
