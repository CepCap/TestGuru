class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = Question.new
  end

  def create
    # question = @find_test.questions.new(question_params)
    @question = Question.new(question_params)
    # if @question.save 
    #   redirect_to @question
    # else
    #   render plain: "Failed to save question"
    # end
  end

  def show
    render inline: "<p> <%= @find_question.body %> </p>"
  end

  def index
    render inline: "<p> <%= @find_test.questions.pluck(:body).join(' | ') %> </p>"
  end

  def destroy
    @find_question.destroy
    redirect_to test_path(@find_test)
  end

  private

  def find_test
    @find_test = Test.find(params[:test_id])
  end

  def find_question
    @find_question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
    head 404
  end
end
