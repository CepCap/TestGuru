class QuestionsController < ApplicationController
  before_action :find_question, only: [:create, :index, :show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    question = Question.create(question_params) unless question_params == nil
    question.test_id = params[:test_id]
    render plain:question.inspect
    # redirect_to controller: :tests, action: "show", id: params[:test_id] 
  end

  def index
    render inline: "<p> <%= @question.pluck(:body).join(' | ') %> </p>"
  end

  def show
    render inline: "<p> <%= @question.body %> </p>"
  end

  def destroy
    @question.destroy
  end

  private

  def find_question
    @question = Test.find(params[:test_id]).questions
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
