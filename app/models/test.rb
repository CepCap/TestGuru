class Test < ApplicationRecord
  def self.show_by_category(category)
    category_level = Category.where(title: category).select(:level).take.level
    chosen_category = Test.all.select { |test| test.level == category_level }
    chosen_category.map(&:title)
  end
end
