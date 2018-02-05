desc "A scheduled task that confirms the upcoming meetup"
task :ask_for_confirmation => :environment do
  if Date.parse('2018-01-22').upto(Date.today).count % 14 == 0
    puts "starting scheduling task"

    next_meetup = Meetup.where(date: nil).left_joins(:assistances).group(:id).order('COUNT(assistances.id) DESC').first
    puts "next meetup is '#{next_meetup.title}'"
    MeetupMailer.ask_for_confirmation(next_meetup, next_meetup.holdings.first.user).deliver
    next_meetup.update(confirmation_mail: true)
    puts "email sent to #{next_meetup.holdings.first.user.email}"
    puts "ending scheduling task"
  end
end
