class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  EMAIL_CHECK = /\A\S+@.+\.\S+\z/

  scope :passed_tests_by_level, -> (level) { where(level: level) }

  validates :name, presence: true
  validates :email, presence: true
end
