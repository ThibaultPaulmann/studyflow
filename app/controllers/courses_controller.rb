class CoursesController < ApplicationController
  def index
    @courses = current_user.courses
  end

  def show
    @course = Course.find(params[:id])
    @assignments = Assignment.where(course: @course)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path(@course)
      flash[:notice] = "Your listing has been created!"
    else
      render :new, status: :unprocessable_entity
      flash[:alert] = "Listing creation unsuccesful"
    end
  end

  private

  def course_params
    params.require(:course).permit(:code, :name)
  end
end
