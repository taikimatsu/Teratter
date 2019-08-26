class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!
  PER = 10

  def index
  	@users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @clips = Clip.where(user_id: @user.id).page(params[:page]).per(PER)
    @memorys = @user.memorys.page(params[:page]).per(10)
    @questions = @user.questions.page(params[:page]).per(PER).order(created_at: "DESC")
  end

  def edit
    @user = User.find(params[:id])
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
