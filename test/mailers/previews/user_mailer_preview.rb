# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # 11/06/2019, MD, test setup. should be remove once done
  def event_mate_up
    event = Event.first
    user = User.first
    UserMailer.with(user: user, event: event).event_mate_up
  end

end
