class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.x.mail.from
  default bcc: Rails.configuration.x.mail.bcc
  layout "mailer"
end
