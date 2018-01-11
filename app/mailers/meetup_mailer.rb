class MeetupMailer < ApplicationMailer
  default from: "hola@infusionvlc.com"

  def subscribed_to(meetup, user)
    @user = user
    @meetup = meetup.title
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.subscribed_to.subject', \
             meetup: @meetup))
    end
  end

end
