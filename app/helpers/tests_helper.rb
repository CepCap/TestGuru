module TestsHelper
  def test_header
    if @test.new_record?
      "Create New Test"
    elsif @test.errors.present?
      "Error"
    else
      "Edit test"
    end
  end
end
