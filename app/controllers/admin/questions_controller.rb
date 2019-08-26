class Admin::QuestionsController < ApplicationController
  impressionist :actions=> [:show]
  PER = 10

  def index
  	@question = Question.new
  	@questions = Question.page(params[:page]).per(PER).order(created_at: "DESC").search(params[:search])
    @most_viewed = Question.order('impressions_count DESC').take(10)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.page(params[:page]).per(PER).order(created_at: "DESC")
    impressionist(@question, nil, unique: [:session_hash])
  end

  def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to admin_questions_path
  end
end
