class QuestionsController < ApplicationController
  def index
    @data = []
    questions = Question.where(assignment: params[:assignment_id])
    questions.each do |question|
      hash = {
        question: question,
        answers: Answer.where(question: question)
      }
      @data << hash
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.assignment = params[:assignment_id]
    @question.save
  end

  def update
    @question = Question.find(params[:question_id])
    @question.update(update_params)
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def update_params
    params.require(:question).permit(:upvotes)
  end
end
