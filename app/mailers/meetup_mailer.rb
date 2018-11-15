# frozen_string_literal: true

class MeetupMailer < ApplicationMailer
  default from: "INFUSIÓN <hola@infusionvlc.com>"

  # Sends a mail to a user when he/she upvotes a meetup
  def subscribed_to(meetup, user)
    @user = user
    @meetup = meetup
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.subscribed_to.subject', \
             meetup: @meetup.title))
    end
  end

  # Sends a mail to a user when he/she is added as a collaborator in a meetup
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

  # Sends a mail to a user when a collaborator leaves a meetup where he/she is a host
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

  # Sends a mail to a user when a meetup he/she was subscribed to is confirmed
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

  # Sends a mail to a user asking for his/her confirmation when his/her
  # meetup gets to the top of the ranking
  # and the scheduler chooses it
  def ask_for_confirmation(meetup, user)
    @user   = user
    @meetup = meetup
    @date   = meetup.sessions.last.event.date
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.ask_for_confirmation.subject', \
             meetup: @meetup.title), \
             date: @date)
    end
  end

  # Sends a mail to a user when he/she has not confirmed his/her assistance
  # two days after the scheduler sent the first confirmation email
  def insist_on_confirmation(meetup, user)
    @user   = user
    @meetup = meetup
    @date   = meetup.sessions.last.event.date
    I18n.with_locale(@user.locale) do
        mail(to: @user.email,
             subject: I18n.t('meetup_mailer.insist_on_confirmation.subject', \
             meetup: @meetup.title), \
             date: @date)
    end
  end

end
