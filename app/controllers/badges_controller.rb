class BadgesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_badges, only: %i[index]

  def index
  end

  private

  def find_badges
    @badges = current_user.badges
  end
end
