class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  PERCENT_TO_PASS = 85

  def badge_check(current_user)
    UserBadge.new.check!(self.test, current_user) if result == 'success'
  end

  def completed?
    current_question.nil?
  end

  def result
    if completion_percent > PERCENT_TO_PASS
      'success'
    else
      'fail'
    end
  end

  def count
    self.test.questions.index(current_question) + 1
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completion_percent
    (self.correct_questions.to_f / self.test.questions.count.to_f * 100).to_i
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct if current_question.answers.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
