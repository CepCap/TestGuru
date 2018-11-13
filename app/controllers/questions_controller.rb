class QuestionsController < ApplicationController
  before_action :current_test, only: [:create, :index, :show, :destroy]
  before_action :find_question, only: [:create, :index, :show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      render plain: "Failed to save question"
    end
    question.test_id = params[:test_id]
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

  def current_test
    @test = Test.find(params[:test_id])
  end

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
