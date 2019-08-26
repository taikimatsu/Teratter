class User::AnswersController < ApplicationController
  def new
  	@question = Question.find(params[:question_id])
  	@answer = Answer.new
  	@user = current_user
  end

  def create
  	question = Question.find(params[:question_id])
    answer = current_user.answers.new(answer_params)
    answer.question_id = question.id
    answer.save
    redirect_to user_questions_path
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to user_question_path(@answer.question)
  end

  def answer_params
  	params.require(:answer).permit(:user_id, :body, :question_id)
  end
end
