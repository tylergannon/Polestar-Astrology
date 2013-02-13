class FeedbackMailer < ActionMailer::Base
  default from: "tgannon@gmail.com"
  
  def submitted(feedback)
    @feedback = feedback
    mail(:to => "tgannon@gmail.com", :subject => "New Feedback from Polestar Astrology App")
  end
end
