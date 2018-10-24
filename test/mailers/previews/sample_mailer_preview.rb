# Preview all emails at http://localhost:3000/rails/mailers/sample_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sample_mailer/send_when_update
  def user
    user = User.new(user_name: "太郎")
    ContactMailer.sent(user)
  end
  
  def invite
    invite = Invite.new(message: "hello")
    ContactMailer.invite(invite)
  end

end
