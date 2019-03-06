class Feedback
  include ActiveModel::Model

  validates :message, presence: true
end
