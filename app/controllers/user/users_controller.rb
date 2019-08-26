class User::UsersController < ApplicationController
  PER = 10
  def show
    @user = User.find(params[:id])
    @clips = Clip.where(user_id: @user.id).all
    @memorys = @user.memorys.page(params[:page]).per(PER).order(created_at: "DESC")
    @questions = @user.questions.page(params[:page]).per(PER).order(created_at: "DESC")
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :gender, :age, :name, :profile_image, :prefecture_id)
  end
end
