desc "A scheduled task that confirms the upcoming meetup"
task :ask_for_confirmation => :environment do
  next_event = Event.where('events.date >= ?', Date.today).order('date ASC').first

  if next_event && next_event.date.upto(Date.today).count == 7
    puts "starting scheduling task"

    next_session = Session.where(event_id: nil).left_joins(:assistances).group(:id).order('COUNT(assistances.id) DESC').first

    puts "next meetup is '#{next_session.meetup}'"

    MeetupMailer.ask_for_confirmation(next_session.meetup, next_session.meetup.holdings.first.user).deliver
    next_session.meetup.update(confirmation_mail: true)

    puts "email sent to #{next_meetup.holdings.first.user.email}"
    puts "ending scheduling task"
  end
end
