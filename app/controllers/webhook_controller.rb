class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def reply
    if params[:result][:action] == 'getNextMeetupDate'
      msg = nextMeetupDate
    elsif params[:result][:action] == 'getNextMeetupSpeaker'
      context = params[:result][:contexts].any? {|context| context[:name].downcase == 'nextmeetup'}
      msg = nextMeetupSpeaker(context)
    elsif params[:result][:action] == 'getCallForTalks'
      msg = getCallForTalks
    end
    res = { speech: msg[0], displayText: msg[0], source: 'webhookdata' }
    if msg[1]
      res[:data] = { telegram: { text: msg[0], reply_markup: { inline_keyboard: [[{text: '🌐', url: msg[1]}]] } } }
    end
    render json: res
  end

  private
  def nextMeetupDate
    @meetup = Meetup.where('date >= ?', Date.today).first #TODO
    if @meetup
      msg = ["El meetup #{@meetup.title} tendrá lugar el  #{@meetup.date.strftime('%d/%m/%y')}", url_for(@meetup)]
    else
      msg = ["Vaya, parece que no hay ningún meetup planificado. Pero todavía puedes participar en la votación", "http://infusionvlc.com/call_for_talks"]
    end
  end

  def nextMeetupSpeaker(context)
    @meetup = Meetup.where('date >= ?', Date.today).first #TODO
    if @meetup
      if context == true
        msg = ["#{@meetup.hosts.first.username}", "http://www.infusionvlc.com/#{@meetup.hosts.first.username}"]
      else
        msg = ["El próximo meetup es #{@meetup.title} y lo da #{@meetup.hosts.first.username}", url_for(@meetup)]
      end
    else
      msg = ["No hay ningún meetup planeado todavía. Pero puedes ver las charlas de los anteriores ponentes en nuestra web.", "http://infusionvlc.com/archive"]
    end
  end

  def getCallForTalks
    @meetups = Meetup.where(date: nil).left_joins(:assistances).group(:id).order('COUNT(assistances.id) DESC')

    if @meetups.count == 0
      msg = ["Vaya, parece que no hay ningún meetup para votar. ¿Por qué no te animas y propones tú uno?", "http://infusionvlc.com/archive"]
    else
      res = "Aquí tienes los meetups que están para votar:\n"
      @meetups.each do |meetup|
        res << "🔸 #{meetup.title}\n"
      end
      msg = [res, "http://www.infusionvlc.com/call_for_talks"]
    end
  end
end
