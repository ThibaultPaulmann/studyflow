class CoursesController < ApplicationController
  def index
    @enrolledCourses = CourseEnrollment.where(user: current_user)
    @courses = @enrolledCourses.map { |e| e.course }
  end

  def show
    @course = Course.find(params[:id])
  end
end
