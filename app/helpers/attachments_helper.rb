# frozen_string_literal: true

module AttachmentsHelper
  def file_icon(attachment)
    type = attachment.file_content_type
    case type
    when /video/
      fa_icon 'file-video-o'
    when /image/
      fa_icon 'file-image-o'
    when /audio/
      fa_icon 'file-audio-o'
    when /text/
      fa_icon 'file-code-o'
    when /pdf/
      fa_icon 'file-pdf-o'
    when /zip/
      fa_icon 'file-archive-o'
    else
      fa_icon 'file-o'
    end
  end
end
