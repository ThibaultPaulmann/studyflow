require "test_helper"

class CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get course_name_url
    assert_response :success
  end

  test "should get code:integer" do
    get course_code:integer_url
    assert_response :success
  end
end
