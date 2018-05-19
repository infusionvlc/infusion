class NotificationMailer < ApplicationMailer
  default from: 'INFUSIÓN <hola@infusionvlc.com>'
  def notify_proposal(activity, user)
    @user = user
    @activity = activity
    I18n.with_locale(@user.locale) do
      if @activity.objective_type == 'Assistance' && @user.notify_comments
        mail(to: @user.email,
             subject: I18n.t('notification_mailer.notify_activity.subject_assistance', \
                             activity: @activity.objective.review), \
             date: @date)
      elsif @activity.objective_type == 'Proposal' && @user.notify_proposals
        mail(to: @user.email,
             subject: I18n.t('notification_mailer.notify_activity.subject_proposal', \
                             activity: @activity.objective.title), \
             date: @date)
      elsif @user.notify_meetups
        mail(to: @user.email,
             subject: I18n.t('notification_mailer.notify_activity.subject_meetup', \
                             activity: @activity.objective.title), \
             date: @date)
      end
    end
  end
end
