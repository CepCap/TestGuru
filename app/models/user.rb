class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, uniqueness: :true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

end
