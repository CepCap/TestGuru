class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def complete_test(test_id)
    self.tests << Test.find(test_id)
  end

  def show_passed_tests_by_level(level)
    tests_done = []
    categories_id = Category.where(level: level).pluck(:id)
    self.tests.to_a.each { |test| tests_done << test if categories_id.include?(test.category_id) }
    tests_done
  end
end
