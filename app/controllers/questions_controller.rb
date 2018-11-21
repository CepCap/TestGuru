class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @test = Test.find(params[:test_id])
    @question = Question.new
  end

  def create
    @test = @find_test
    @question = Question.new(question_params)
    @question.test_id = params[:test_id]
    if @question.save 
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = @find_question
  end

  def index
    @questions = Question.where(test_id: params[:test_id])
  end

  def destroy
    @question = @find_question
    @question.delete
    redirect_to test_path(@question.test_id)
  end

  def edit
    @find_question
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
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
