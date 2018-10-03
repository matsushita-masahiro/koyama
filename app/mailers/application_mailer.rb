class ApplicationMailer < ActionMailer::Base
  default from: 'こそだて広場',
          bcc: "elle_deco@hotmail.co.jp",
          replay_to:  "elle_deco@hotmail.co.jp"       
  layout 'mailer'
end
