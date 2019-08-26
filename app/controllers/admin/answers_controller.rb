class Admin::AnswersController < ApplicationController
	def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end
end
