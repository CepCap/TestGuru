class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
    #   TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_question = GistQuestionService.new(@test_passage.current_question, current_user)
    url = gist_question.create.url
    if gist_question.client.last_response.status == 201
      Gist.create(question: @test_passage.current_question, user: current_user, link: url).save
      flash_options = { notice: t('test_passage.gist.success') }
    else
      flash_options = { alert: t('test_passage.gist.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
    @test_passage.user_id = current_user.id
  end

end
