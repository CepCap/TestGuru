class FeedbacksMailer < ApplicationMailer

  def send_feedback(feedback)
    @message = feedback.message
    @admin_mail = ENV['SMTP_USERNAME']
    mail(to: @admin_mail, from: @admin_mail, subject: 'Feedback from Testguru')
  end
end
