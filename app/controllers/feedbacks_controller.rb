class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(message_params)
    @feedback.user = current_user
    if @feedback.valid?
        FeedbacksMailer.send_feedback(@feedback).deliver_now!
        redirect_to root_path
        flash[:notice] = "We have received your message and will be in touch soon!"
      else
        flash[:notice] = "There was an error sending your message. Please try again."
        render :new
      end
    end

  private

  def message_params
    params.require(:feedback).permit(:message)
  end
end
