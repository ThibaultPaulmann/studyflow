class UserAssignmentsController < ApplicationController
  def update
    user_assignment = UserAssignment.find(params[:id])
    if user_assignment.update(user_assignment_params)
      raise
      redirect_to course_assignment_path(user_assignment.assignment)
      flash[:notice] = "user progress updated"
    else  
      flash[:alert] = "Error upvoting the question"
      raise
    end
  end

  private
  
  def user_assignment_params
    params.require(:user_assignment).permit(:user_progress)
  end
end
