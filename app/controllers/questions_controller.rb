class QuestionsController < ApplicationController
  def index
    if params[:query].present?
      questions = Question.search_by_title(params[:query]).where(assignment: params[:assignment_id])
    else
      questions = Question.where(assignment: params[:assignment_id])
    end
    @data = []
    @assignment = Assignment.find(params[:assignment_id])
    @course = @assignment.course
    @question = Question.new
    @answer = Answer.new
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
    @assignment = Assignment.find(params[:assignment_id])
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.assignment = Assignment.find(params[:assignment_id])
    @assignment = @question.assignment
    @course = @assignment.course
    if @question.save!
      redirect_to course_assignment_questions_path(@course, @assignment)
      flash[:notice] = "Question posted!"
    else
      render :index, status: :unprocessable_entity
      flash[:alert] = "Error posting the question"
    end
  end

  def show
    @question.assignment = params[:assignment_id]
    @question = Question.new
  end


  def upvote
    unless signed_in?
      redirect_to new_user_session_path
      flash[:alert] = "You need to log in first"
    else
      @question = Question.find(params[:id])
      if current_user.voted_up_on? @question
        @question.unvote_by current_user
      else
        @question.upvote_by current_user
      end
      redirect_to course_assignment_questions_path
      flash[:notice] = "Question upvoted!"
    end
  end

  def downvote
    unless signed_in?
      redirect_to new_user_session_path
      flash[:alert] = "You need to log in first"
    else
      @question = Question.find(params[:id])
      if current_user.voted_down_on? @question
        @question.unvote_by current_user
      else
        @question.downvote_by current_user
      end
      redirect_to course_assignment_questions_path
      flash[:notice] = "Question downvoted!"
    end
  end

  # def upvote
  #   @question = Question.find(params[:question_id])
  #   newUpvotes = @question.upvotes + 1
  #   if @question.update(upvotes: newUpvotes)
  #     redirect_to assignment_questions_path
  #     flash[:notice] = "Question upvoted!"
  #   else
  #     flash[:alert] = "Error upvoting the question"
  #   end
  # end

  private

  def question_params
    params.require(:question).permit(:title)
  end
end
