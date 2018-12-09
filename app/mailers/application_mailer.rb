# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('MAILER_EMAIL', 'info@lunch.co')
  layout 'mailer'
end
