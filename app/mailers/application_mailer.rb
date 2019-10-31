# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'support@social-net.local'
  layout 'mailer'
end
