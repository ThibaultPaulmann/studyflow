class CoursesController < ApplicationController
  def index
    # @enrolledCourses = CourseEnrollment.where(user: current_user)
    # @courses = @enrolledCourses.map { |e| e.course }

    @courses = current_user.courses
  end

  def show
    @course = Course.find(params[:id])
  end
end
