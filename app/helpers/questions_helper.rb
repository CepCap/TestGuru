module QuestionsHelper
  
  def question_header
    if @question.id.nil?
      "Create New Question for: #{@test.title} "
    elsif @question.errors.present?
      "Error"
    else
      "Edit Question For Test: #{@question.test.title} "
    end
  end
end
