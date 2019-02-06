class FeedbacksController < ApplicationController
  include ActiveModel::Model

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.send_feedback(@feedback).deliver_now!
      redirect_to root_path
      flash[:notice] = "We have received your message and will be in touch soon!"
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message, :user_id)
  end
end
