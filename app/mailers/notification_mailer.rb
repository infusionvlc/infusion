class NotificationMailer < ApplicationMailer
    default from: "INFUSIÓN <hola@infusionvlc.com>"
    def notify_proposal(activity, user)
        @user   = user
        @activity = activity
        I18n.with_locale(@user.locale) do
            if @activity.objective_type == 'Assistance'
                mail(to: @user.email,
                subject: I18n.t('notification_mailer.notify_activity.subject_assistance', \
                activity: @activity.objective.review), \
                date: @date)
            elsif @activity.objective_type == 'Proposal'
                mail(to: @user.email,
                subject: I18n.t('notification_mailer.notify_activity.subject_proposal', \
                activity: @activity.objective.title), \
                date: @date)
            else
                mail(to: @user.email,
                subject: I18n.t('notification_mailer.notify_activity.subject_meetup', \
                activity: @activity.objective.title), \
                date: @date)
            end            
        end
      end
end