class User < ApplicationRecord
  attr_reader :passed_tests

  def pass_test
    @passed_tests << Test.all.sample if @passed_tests
    @passed_tests ||= [Test.all.sample]
  end

  def passed_tests_by_level(level)
    @passed_tests.select { |test| test.level == level }
  end
end
