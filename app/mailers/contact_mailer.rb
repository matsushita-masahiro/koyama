class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sent.subject
  #
  def sent(user)
    @user = user
    mail(to: @user.email, subject: "Thank you!")
  end
  
  def invite(invite)
    @invite = invite
    mail(to: @invite.email, subject: "こそだて広場に遊びに来てね")
  end
  
  
  
  
end