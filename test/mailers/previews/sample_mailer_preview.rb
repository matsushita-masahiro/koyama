# Preview all emails at http://localhost:3000/rails/mailers/sample_mailer
class SampleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sample_mailer/send_when_update
  def user
    
    user = User.new(user_name: "太郎")
    SampleMailer.send_when_update(user)
  end

end
