class MeetupMailer < ApplicationMailer
  default from: "INFUSIÓN <hola@infusionvlc.com>"

  def subscribed_to(meetup, user)
    @user = user
    @meetup = meetup.title
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.subscribed_to.subject', \
             meetup: @meetup))
    end
  end

  def notify_publication(meetup, user)
    @user   = user
    @meetup = meetup.title
    @date   = I18n.l(meetup.date)
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.notify_publication.subject', \
             meetup: @meetup), \
             date: @date)
    end
  end

end
