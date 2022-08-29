class AssignmentsController < ApplicationController

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to assignments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  private

end
