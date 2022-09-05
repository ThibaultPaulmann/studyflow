class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find(params[:id])
    @course = Course.find(params[:course_id])
    @study_session = StudySession.new
    @user_assignments = UserAssignment.where(assignment: @assignment).reject { |assignment| assignment.user == current_user}
    @current_user_assignment = UserAssignment.where(assignment: @assignment).find_by(user: current_user)
    difficultyArray = @assignment.user_assignments.filter { |assignment| assignment.difficulty != nil }

    if difficultyArray.empty?
      @difficulty = 0
    else
      @difficulty = difficultyArray.reduce(0) { |sum, user_assignment| sum + (user_assignment.difficulty.to_f / difficultyArray.size)}.round
    end
    if @current_user_assignment.user_progress == "Not started"
      @current_user_assignment.update(user_progress: "Working")
    end
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
