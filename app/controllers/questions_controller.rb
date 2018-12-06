class QuestionsController < ApplicationController
  before_action :find_test, only: [:create, :new]
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

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

  def destroy
    @question.delete
    redirect_to test_path(@question.test)
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
