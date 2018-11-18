# frozen_string_literal: true

module ApplicationHelper
  # Determines flash alerts css class based on the level parameter
  def flash_class(level)
    case level
      when 'notice' then 'info'
      when 'success' then 'success'
      when 'error' then 'danger'
      when 'alert' then 'warning'
    end
  end

  # Returns a link to the code of conduct page
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
