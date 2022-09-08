class UsefulResourcesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    @useful_resource = UsefulResource.new(useful_resource_params)
    @useful_resource.course = course
    if @useful_resource.save
      redirect_to course_path(course)
      flash[:notice] = "Your resource has been added!"
    else
      flash[:alert] = "Listing creation unsuccesful"
      redirect_to course_path(course)
    end
  end

  private

  def useful_resource_params
    params.require(:useful_resource).permit(:name, :link)
  end
end
