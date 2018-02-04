class MeetupMailer < ApplicationMailer
  default from: "INFUSIÓN <hola@infusionvlc.com>"

  def subscribed_to(meetup, user)
    @user = user
    @meetup = meetup
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.subscribed_to.subject', \
             meetup: @meetup.title))
    end
  end

  def notify_collaboration(meetup, user)
    @user = user
    @meetup = meetup
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.notify_collaboration.subject', \
             meetup: @meetup.title, \
             owner: @meetup.holdings.first.user.username))
    end
  end

  def notify_abandon(meetup, user, canceled)
    @user = user
    @meetup = meetup
    @canceled = canceled
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.notify_abandon.subject', \
             meetup: @meetup.title, \
             owner: @meetup.holdings.first.user.username, \
             canceled: @canceled.username))
    end
  end

  def notify_publication(meetup, user)
    @user   = user
    @meetup = meetup
    @date   = I18n.l(meetup.date)
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.notify_publication.subject', \
             meetup: @meetup.title), \
             date: @date)
    end
  end

  def ask_for_confirmation(meetup, user)
    @user   = user
    @meetup = meetup
    @date   = I18n.l(Date.today.monday+4)
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.ask_for_confirmation.subject', \
             meetup: @meetup.title), \
             date: @date)
    end
  end

end
