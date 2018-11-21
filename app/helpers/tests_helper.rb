module TestsHelper
  def test_header
    if params[:action] == "new"
      "Create New Test"
    elsif params[:action] == "edit"
      "Edit test"
    else
      "Error"
    end
  end
end
