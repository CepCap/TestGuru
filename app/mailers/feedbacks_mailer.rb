class FeedbacksMailer < ApplicationMailer
  default from: ENV['SMTP_USERNAME']

  def send_feedback(feedback)
    @message = feedback.message
    mail(to: ENV['SMTP_USERNAME'], subject: 'Feedback from Testguru')
  end
end
