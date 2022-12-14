class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.photo.attach(params[:photo])
    raise
    if @user.update(user_params)
      flash[:notice] = "Your account information was succesfully updated"
      # redirect_to caravans_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    @user.photo.attach(params[:photo])
    if @user.save
        flash[:notice] = "Welcome to StudyFlow"
        redirect_to user_path(@user)
    else
        render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstName, :lastName, :photo)
  end
end
