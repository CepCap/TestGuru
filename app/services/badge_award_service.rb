class BadgeAwardService

  def call(test_passage)
    @current_user = test_passage.user
    @current_test = test_passage.test
    @tests_done = @current_user.test_passages.take(@current_user.test_passages.all.count-1).pluck(:test_id).uniq

    badges = []

    Badge.all.each do |badge|
      badges.push(badge) if send("#{badge.requirement}_completed?")
    end

    badges
  end

  private

  def first_time_completed?
    if @tests_done.exclude?(@current_test.id)
      give_badge('first_time')
    end
  end

  def category_completed?
    tests_in_category = @current_test.category.tests.pluck(:id)
    if (tests_in_category - @tests_done).empty?
      give_badge('category')
    end
  end

  def level_completed?
    tests_on_level = Test.all.where(level: @current_test.level).pluck(:id)
    if (tests_on_level - @tests_done).empty?
      give_badge('level')
    end
  end

  def give_badge(requirement)
    Badge.where(requirement: requirement).each do |badge|
      @current_user.user_badges.create(badge_id: badge.id)
    end
  end

end
