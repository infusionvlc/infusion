module AttachmentsHelper
  def file_icon(attachment)
    type =  attachment.file_content_type
    if type =~ %r(video)
        fa_icon 'file-video-o'
    elsif type =~ %r(image)
        fa_icon 'file-image-o'
    elsif type =~ %r(audio)
        fa_icon 'file-audio-o'
    elsif type =~ %r(text)
        fa_icon 'file-code-o'
    elsif type =~ %r(pdf)
        fa_icon 'file-pdf-o'
    elsif type =~ %r(zip)
        fa_icon 'file-archive-o'
    else 
        fa_icon 'file-o'
    end
  end
end
