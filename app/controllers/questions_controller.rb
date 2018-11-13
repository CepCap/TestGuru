class QuestionsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    question = Question.create(question_params)
    question.test_id = params[:test_id]
    render plain:question.inspect
    # redirect_to controller: :tests, action: "show", id: params[:test_id] 
  end

  def index
    render inline: "<p> <%= Question.where(test_id: params[:test_id]).collect(&:body).join(' | ') %> </p>"
  end

  def show
    render inline: "<p> <%= Question.find(params[:id]).body %> </p>"
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
