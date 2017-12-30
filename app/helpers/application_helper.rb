module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then 'info'
      when 'success' then 'success'
      when 'error' then 'error'
      when 'alert' then 'warning'
    end
  end
end
