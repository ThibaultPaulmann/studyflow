class QuestionsController < ApplicationController
  before_action :set_assignment_and_course, except: [:show, :upvote, :downvote]


  def index
    if params[:query].present?
      questions = Question.search_by_title(params[:query]).where(assignment: params[:assignment_id])
    else
      questions = Question.where(assignment: params[:assignment_id])
    end
    @data = []
    @question = Question.new
    @answer = Answer.new
    questions.order(cached_weighted_score: :desc).each do |question|
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
    @question.assignment = @assignment

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
    @question = Question.find(params[:id])
    if current_user.voted_up_on? @question
      @question.unvote_by current_user
    else
      @question.upvote_by current_user
    end

    respond_to do |format|
      format.html { redirect_to course_assignment_questions_path }
      format.json { render json: { upvote_buttons: render_to_string(partial: "components/upvote_buttons", locals: { question: @question }, formats: [:html]) } }
    end
  end

  def downvote
    @question = Question.find(params[:id])
    if current_user.voted_down_on? @question
      @question.unvote_by current_user
    else
      @question.downvote_by current_user
    end
    respond_to do |format|
      format.html { redirect_to course_assignment_questions_path }
      format.json { render json: { upvote_buttons: render_to_string(partial: "components/upvote_buttons", locals: { question: @question }, formats: [:html]) } }
    end
  end

  private

  def set_assignment_and_course
    @assignment = Assignment.find(params[:assignment_id])
    @course = @assignment.course
  end



  def question_params
    params.require(:question).permit(:title)
  end
end
