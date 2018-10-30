class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category
  
  def self.show_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order('id DESC').collect(&:title)
  end
end
