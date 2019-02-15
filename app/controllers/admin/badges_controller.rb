class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[update edit]

  def index
    @badges = Badge.all
  end

  def create
    @badge = current_user.badges.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge]
    else
      render :new
    end
  end

  def new
    @badge = Badge.new
  end

  def update
    if @badge.update(badge_params)
      redirect_to @badge
    else
      render :edit
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :description, :picture_link, :requirement)
  end

end
