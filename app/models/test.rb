class Test < ApplicationRecord
  has_and_belongs_to_many :users

  def self.show_by_category(category)
    categories_id = Category.where(title: category).pluck(:id)
    tests = []
    categories_id.each { |cat_id| tests << Test.where(category_id: cat_id).to_a }
    tests[0].reverse
  end
end
