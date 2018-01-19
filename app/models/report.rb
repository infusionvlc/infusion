class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  
  def reportable_title
    if reportable_type == "Meetup"
      Meetup.find(reportable_id).title
    elsif reportable_type == "Assistance"
      Assistance.find(reportable_id).title
    else
      Proposal.find(reportable_id).title
    end    
  end

  def get_text_type
    case type_of
      when 0
        (I18n.t 'report.hate')
      when 1
        (I18n.t 'report.menace')
      when 2
        (I18n.t 'report.pornograpy')
      when 3
        (I18n.t 'report.communty')
      when 4
        (I18n.t 'report.other')
    end
  end
  
  def get_text_status
    case status
      when 0
        (I18n.t 'report.open')
      when 1
        (I18n.t 'report.revision')
      when 2
        (I18n.t 'report.revised')
      when 3
        (I18n.t 'report.closed')
    end
  end
  
end
