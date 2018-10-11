# frozen_string_literal: true

module AttachmentsHelper
  def file_icon(attachment)
    type = attachment.file_content_type
    case type
    when /video/
      icon('fas', 'file-video')
    when /image/
      icon('fas', 'file-image')
    when /audio/
      icon('fas', 'file-audio')
    when /text/
      icon('fas', 'file-code')
    when /pdf/
      icon('fas', 'file-pdf')
    when /zip/
      icon('fas', 'file-archive')
    else
      icon('fas', 'file')
    end
  end
end
