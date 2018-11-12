class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:question_id) unless question.answers.count.between?(0, 4)
  end
end
