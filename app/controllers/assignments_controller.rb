class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
    @user_assignments = UserAssignment.where(assignment: @assignment)
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:course_id])
    @study_session = StudySession.new
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
      @course.users.each do |user|
        UserAssignment.create!(user: user, assignment: @assignment, user_progress: "Not started")
      end
      redirect_to course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
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


  private

  def assignment_params
    params.require(:assignment).permit(:due_date, :title, photos: [])
  end
end
