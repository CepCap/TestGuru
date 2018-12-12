class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show destroy update start edit]

  def index
    @tests = Test.all
  end

  def show
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end 

  def new
    @test = Test.new
    @test.author = current_user
  end

  def edit
  end

  def update
    @test.author = current_user
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.delete
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test) 
    redirect_to current_user.test_passage(@test)
  end

  private 

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
