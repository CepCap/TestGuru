class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  def self.show_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order('id DESC').pluck('tests.title')
  end
end
