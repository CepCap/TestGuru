class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true

  validate :validate_positive_level

  scope :easy, -> { where(level: 0..1) }
  scope :intermediate, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }


  def self.show_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order('tests.id DESC').collect(&:title)
  end

  private

  def validate_positive_level
    errors.add(:level) if level < 0
  end
end
