class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  def check!(current_test, current_user)
    @current_user = current_user
    @current_test = current_test
    @tests_done = @current_user.test_passages.all.pluck(:test_id).uniq
    @badges = []
    @badges.push(first_time_done,
                 category_done,
                 level_done)
    @badges
  end

  private

  def first_time_done
    if @tests_done.exclude?(@current_test.id)
      give_badge(:first_time)
    end
  end

  def category_done
    tests_in_category = @current_test.category.tests.pluck(:id)
    if (tests_in_category - @tests_done).empty?
      give_badge(:category)
    end
  end

  def level_done
    tests_on_level = Test.all.where(level: @current_test.level).pluck(:id)
    if (tests_on_level - @tests_done).empty?
      give_badge(:level)
    end
  end

  def give_badge(requirement)
    case requirement
    when :first_time
      Badge.where(requirement: :first_time).each do |badge|
        @current_user.user_badges.create(badge_id: badge)
      end
    when :category
      Badge.where(requirement: :category).each do |badge|
        @current_user.user_badges.create(badge_id: badge)
      end
    when :level
      Badge.where(requirement: :level).each do |badge|
        @current_user.user_badges.create(badge_id: badge)
      end
    else
      nil
    end
  end

end
