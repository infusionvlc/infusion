class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true

  def reportable_title
    if reportable_type == 'Meetup'
      Meetup.find(reportable_id).title
    elsif reportable_type == 'Assistance'
      Assistance.find(reportable_id).title
    else
      Proposal.find(reportable_id).title
    end
  end

  def text_type
    case type_of
    when 0
      (I18n.t 'report.type.hate')
    when 1
      (I18n.t 'report.type.menace')
    when 2
      (I18n.t 'report.type.pornography')
    when 3
      (I18n.t 'report.type.community')
    when 4
      (I18n.t 'report.type.other')
    end
  end

  def text_status
    case status
    when 0
      (I18n.t 'report.status.open')
    when 1
      (I18n.t 'report.status.revision')
    when 2
      (I18n.t 'report.status.revised')
    when 3
      (I18n.t 'report.status.closed')
    end
  end
end
