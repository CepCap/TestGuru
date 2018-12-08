module TestsHelper
  def test_header
    if @test
      "Create New Test"
    elsif @test.errors.present?
      "Error"
    else
      "Edit test"
    end
  end
end
