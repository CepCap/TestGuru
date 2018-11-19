class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.new(test_params)
  end 

  def new
    @test = Test.new
  end

  private 

  def test_params

  end

  def find_test
    @test = Test.find(params[:id])
  end
end
