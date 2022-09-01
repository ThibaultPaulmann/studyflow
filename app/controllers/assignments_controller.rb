class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @course = Course.find(params[:course_id])
    @assignment.course = @course
    if @assignment.save
      redirect_to course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:due_date, :title, photos: [])
  end
end
