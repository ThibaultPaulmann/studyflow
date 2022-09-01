class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      redirect_to course_assignment_path(@assignment)
      flash[:notice] = "Your assignment has been changed!"
    else
      render :edit, status: :unprocessable_entity
      flash[:alert] = "Couldn't change the assignment"
    end
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
