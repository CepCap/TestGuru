class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.test_id = params[:test_id]
    if @question.save 
      redirect_to @question
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @question.delete
    redirect_to test_path(@question.test_id)
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
    head 404
  end
end
