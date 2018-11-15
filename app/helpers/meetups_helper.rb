# frozen_string_literal: true

module MeetupsHelper

  # Returns a meetup's votes count
  def meetup_votes(meetup)
    count = meetup.assistances.size
    if meetup.date.nil?
      I18n.t 'meetup.votes', count: count
    else
      I18n.t 'meetup.assistants', count: count
    end
  end

  # Returns a link to the video of a meetup
  def video(meetup)
   meetup.video_url[/=(.*)/][1..-1] if meetup.video_url && \
                                       meetup.video_url.length.positive?
  end
end
