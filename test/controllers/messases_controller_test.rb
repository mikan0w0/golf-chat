require 'test_helper'

class MessasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messases_index_url
    assert_response :success
  end

end
