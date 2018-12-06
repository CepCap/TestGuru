require 'digest/sha1'

class User < ApplicationRecord
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, uniqueness: :true
  validate :validate_email_format

  has_secure_password

  def new
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

  private

  def validate_email_format
    errors.add(:email, 'Wrong format') unless email =~ VALID_EMAIL_REGEX
  end

end
