module QuestionsHelper
  
  def question_header
    if params[:action] == "new"
      "Create New Question for: #{Test.find(params[:test_id]).title} "
    elsif params[:action] == "edit"
      "Edit #{Test.find(params[:test_id]).title} Question"
    else
      "Error"
    end
  end
end
