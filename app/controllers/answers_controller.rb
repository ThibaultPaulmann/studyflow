class AnswersController < ApplicationController

  def create
    @answer = Answer.new(params[:question_id])
    @answer.save
    redirect_to questions_path
  end

  def update
    @answer = Answer.find(params[:question_id])
    @answer.update(answer_params)
    redirect_to questions_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
