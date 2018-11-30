class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy update start]
  before_action :find_user, only: %i[start]

  def index
    render inline: '<p>All tests: </p> <%= Test.all.pluck(:title).join(" | ") %>'
  end

  def show
    render inline: '<p> <%= @test.title %> </p>
                   <body> <%= @test.questions.pluck(:body).join(" | ") %> </body>'
  end

  def start
    @user.tests.push(@test) 
    redirect_to @user.test_passage(@test)
  end

  private 

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end
end
