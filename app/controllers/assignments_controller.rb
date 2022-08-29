class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.course = @course
    if @assignment.save
      redirect_to course_assignments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def assignment_params
    params.require(:assigment).permit(:due_date, :title)
  end
end
