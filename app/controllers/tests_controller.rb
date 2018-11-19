class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    render inline: '<p>All tests: </p> <%= Test.all.pluck(:title).join(" | ") %>'
  end

  def show
    render inline: '<p> <%= @test.title %> </p>
                   <body> <%= @test.questions.pluck(:body).join(" | ") %> </body>'
  end

  private 

  def find_test
    @test = Test.find(params[:id])
  end
end
