class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  def self.show_by_category(category)
    Category.joins(:tests).where(title: category).select('tests.*').collect(&:title)
  end
end
