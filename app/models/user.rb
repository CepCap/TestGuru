class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def complete_test(test_id)
    self.tests << Test.find(test_id)
  end

  def show_passed_tests_by_level(level)
    self.tests.where(level: level)
  end
end
