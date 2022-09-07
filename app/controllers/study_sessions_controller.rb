class StudySessionsController < ApplicationController
  def index
    @assignments = current_user.assignments
    booked_sessions = current_user.booked_study_sessions
    @booked_sessions = booked_sessions.filter { |booked_session| booked_session.due_date >= Time.now }.sort_by { |booked_session| booked_session.due_date }
    study_sessions = StudySession.where(assignment: @assignments).where.not(id: @booked_sessions)
    @study_sessions = study_sessions.filter { |study_session| study_session.due_date >= Time.now }.sort_by { |study_session| study_session.due_date }
  end

  def create
    @study_session = StudySession.new(study_session_params)
    @study_session.assignment = Assignment.find(params[:assignment_id])
    if @study_session.save
      redirect_to study_sessions_path
      flash[:notice] = "Study Session Created!"
    else
      flash[:alert] = "Error creating the session"
    end
  end

  private

  def study_session_params
    params.require(:study_session).permit(:title, :duration_minutes, :duration_hours, :due_date)
  end
end
