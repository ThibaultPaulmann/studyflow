class StudySessionsController < ApplicationController

  def index
    @study_sessions = StudySession.all
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
    params.require(:study_session).permit(:title, :duration_minutes, :duration_hours, :meeting_time)
  end
end
