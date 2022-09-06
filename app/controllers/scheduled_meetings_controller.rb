class ScheduledMeetingsController < ApplicationController
  def create
    @scheduled_meeting = ScheduledMeeting.new
    @scheduled_meeting.user_id = current_user.id
    @scheduled_meeting.study_session_id = params[:study_session_id]
    if @scheduled_meeting.save
      flash[:notice] = "You have Scheduled a Meeting!"
      redirect_to study_sessions_path
    else
      flash[:alert] = "Scheduling unsuccesful"
      redirect_to study_sessions_path
    end
  end

  def destroy
    @scheduled_meeting = ScheduledMeeting.find(params[:id])
    @scheduled_meeting.destroy
    redirect_to study_sessions_path
    flash[:notice] = "Your listing has been deleted!"
  end
end
