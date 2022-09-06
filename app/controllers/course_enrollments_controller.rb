class CourseEnrollmentsController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    if course = Course.find_by(shareCode: params[:course][:shareCode])
      course_enrollment = CourseEnrollment.new(user: current_user, course: course, creator: false)
      if course_enrollment.save
        redirect_to courses_path
      else
        @course = Course.new
        flash[:alert] = "You are already registered to this course"
        render :new, status: :unprocessable_entity
      end
    else
      @course = Course.new
      flash[:alert] = "Share code does not exist"
      render :new, status: :unprocessable_entity
    end
  end
end
