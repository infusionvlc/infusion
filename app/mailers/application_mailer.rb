# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'INFUSIÓN <hola@infusionvlc.com>'
  layout 'mailer'
end
