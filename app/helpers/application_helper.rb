module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then 'info'
      when 'success' then 'success'
      when 'error' then 'danger'
      when 'alert' then 'warning'
    end
  end

  def rules
    case @locale
      when 'es'
        link_to 'Código de conducta', '/reglas', target: :blank
      when 'ca'
        link_to 'Codi de conducta', '/regles', target: :blank
      when 'en'
        link_to 'Code of conduct', '/rules', target: :blank
    end
  end
end
