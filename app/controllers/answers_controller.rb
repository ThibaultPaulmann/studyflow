class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.question = Question.find(params[:question_id])
    @answer.user = current_user
    if @answer.save
      redirect_to course_assignment_questions_path(params[:course_id], params[:assignment_id])
      flash[:notice] = "Answer posted!"
    else
      flash[:alert] = "Error posting the answer"
    end
  end

  # def upvote
  #   @answer = Answer.find(params[:answer_id])
  #   newUpvotes = @answer.upvotes + 1
  #   @answer.update(upvotes: newUpvotes)
  #   if redirect_to assignment_questions_path
  #     flash[:notice] = "Answer upvoted!"
  #   else
  #     flash[:alert] = "Error upvoting the answer"
  #   end
  # end

  def upvote
    @answer = Answer.find(params[:id])
    if current_user.voted_up_on? @answer
      @answer.unvote_by current_user
    else
      @answer.upvote_by current_user
    end

    respond_to do |format|
      format.html { redirect_to course_assignment_questions_path }
      format.json { render json: { upvote_buttons: render_to_string(partial: "components/answer_upvote_buttons", locals: { answer: @answer }, formats: [:html]) } }
    end
  end

  def downvote
    @answer = Answer.find(params[:id])
    if current_user.voted_down_on? @answer
      @answer.unvote_by current_user
    else
      @answer.downvote_by current_user
    end
    respond_to do |format|
      format.html { redirect_to course_assignment_questions_path }
      format.json { render json: { upvote_buttons: render_to_string(partial: "components/answer_upvote_buttons", locals: { answer: @answer }, formats: [:html]) } }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
