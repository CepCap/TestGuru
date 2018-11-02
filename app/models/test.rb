class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name 'User', foreign_key: :author_id
  
  def self.show_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order('id DESC').collect(&:title)
  end
end
