class QuestionsController < ApplicationController
  before_action :current_test, only: [:index, :create]
  before_action :current_test_questions, only: [:index, :create]
  before_action :standalone_question, only: [:show, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    question = Question.new(question_params)
    question.test_id = @current_test.id
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
    render inline: "<p> <%= @current_test_questions.pluck(:body).join(' | ') %> </p>"
  end

  def destroy
    @standalone_question.destroy
    redirect_to controller: :tests, action: "show", id: params[:test_id]
  end

  private

  def current_test
    @current_test = Test.find(params[:test_id])
  end

  def current_test_questions
    @current_test_questions = @current_test.questions
  end

  def standalone_question
    @standalone_question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    head 404
  end
end
