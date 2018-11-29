class QuestionsController < ApplicationController
  before_action :current_test, only: [:index, :create]
  before_action :standalone_question, only: [:show, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    question = @current_test.questions.new(question_params)
    if question.save 
      render plain: question.inspect
    else
      render plain: "Failed to save question"
    end
  end

  def show
    render inline: "<p> <%= @standalone_question.body %> </p>"
  end

  def index
    render inline: "<p> <%= @current_test.questions.pluck(:body).join(' | ') %> </p>"
  end

  def destroy
    @standalone_question.destroy
    redirect_to test_path(@current_test)
  end

  private

  def current_test
    @current_test = Test.find(params[:test_id])
  end

  def standalone_question
    @standalone_question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
    head 404
  end
end
