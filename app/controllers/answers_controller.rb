class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.question = Question.find(params[:question_id])
    @answer.user = current_user
    if @answer.save
      redirect_to root_path
      flash[:notice] = "Answer posted!"
    else
      flash[:alert] = "Error posting the answer"
    end
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    newUpvotes = @answer.upvotes + 1
    @answer.update(upvotes: newUpvotes)
    if redirect_to assignment_questions_path
      flash[:notice] = "Answer upvoted!"
    else
      flash[:alert] = "Error upvoting the answer"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
