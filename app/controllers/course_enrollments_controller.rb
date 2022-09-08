class CourseEnrollmentsController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    if course = Course.find_by(shareCode: params[:course][:shareCode])
      course_enrollment = CourseEnrollment.new(user: current_user, course: course, creator: false)
      if course_enrollment.save
        course_enrollment.course.assignments.each { |assignment| UserAssignment.create(user: current_user, assignment: assignment, user_progress: "Not started") }
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

  def edit
    @course_enrollment = CourseEnrollment.find(params[:id])
  end

  def update
    @course_enrollment = CourseEnrollment.find(params[:id])
    if @course_enrollment.update(course_enrollments_params)
      redirect_to courses_path
      flash[:notice] = "Your course color has been changed!"
    else
      render :edit, status: :unprocessable_entity
      flash[:alert] = "Couldn't change the course color"
    end

  end

  private

  def course_enrollments_params
    params.require(:course_enrollment).permit(:color, :icon)
  end
end
