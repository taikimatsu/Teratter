class User::QuestionsController < ApplicationController
  impressionist :actions=> [:show]
  PER = 10

  def index
  	@question = Question.new
  	@questions = Question.page(params[:page]).per(PER).order(created_at: "DESC").search(params[:search])
    @most_viewed = Question.order('impressions_count DESC').take(10)
    @user = current_user
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.page(params[:page]).per(PER).order(created_at: "DESC")
    impressionist(@question, nil, unique: [:session_hash])
  end
   def create
  	@user = current_user
  	@question = Question.new(question_params)
    @question.user_id = current_user.id
      if @question.save
  	    redirect_to user_questions_path
      else
        render :index
      end
  end
  def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to user_questions_path
  end

  private

  def question_params
  	params.require(:question).permit(:user_id, :body)
  end
end
