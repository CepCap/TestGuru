class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  scope :correct, -> { where(correct: true) }
  scope :same_questions, -> (id) { all.where(question_id: id) }

  private

  def validate_answers_count
    errors.add(:question_id) unless Answer.same_questions(self.question_id).count.between?(1, 4)
  end
end
