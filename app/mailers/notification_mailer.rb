class NotificationMailer < ApplicationMailer
    default from: "INFUSIÓN <hola@infusionvlc.com>"

    def notify_proposal(proposal, user)
        @user   = user
        @proposal = proposal
        I18n.with_locale(@user.locale) do
            mail(to: @user.email,
                 subject: I18n.t('notification_mailer.notify_proposal.subject', \
                 proposal: @proposal.title), \
                 date: @date)
        end
      end
end