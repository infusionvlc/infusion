module MeetupsHelper
  def meetup_votes(meetup)
    count = meetup.assistances.size
    if meetup.date.nil?
      I18n.t 'meetup.votes', count: count
    else
      I18n.t 'meetup.assistants', count: count
    end
  end
end
