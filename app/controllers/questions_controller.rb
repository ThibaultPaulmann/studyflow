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
    if @question.save
      redirect_to assignment_questions_path
      flash[:notice] = "Question posted!"
    else 
      render :new, status: :unprocessable_entity
      flash[:alert] = "Error posting the question"
    end
  end

  def upvote
    @question = Question.find(params[:question_id])
    newUpvotes = @question.upvotes + 1
    if @question.update(upvotes: newUpvotes)
      redirect_to assignment_questions_path
      flash[:notice] = "Question upvoted!"
    else
      flash[:alert] = "Error upvoting the question"
    end
    
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end
end
