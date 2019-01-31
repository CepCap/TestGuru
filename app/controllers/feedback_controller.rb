class FeedbackController < ApplicationController

  def new
    @message = Message.new
  end

  def send
    @message = Message.new(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
