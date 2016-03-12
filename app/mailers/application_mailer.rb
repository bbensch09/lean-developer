class ApplicationMailer < ActionMailer::Base
  default from: 'citizendebate16@gmail.com',
    cc: 'citizendebate16@gmail.com'
  layout 'mailer'
end
