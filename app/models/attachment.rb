# frozen_string_literal: true

class Attachment < ApplicationRecord
  belongs_to :meetup
  has_attached_file :file
  do_not_validate_attachment_file_type :file
  before_post_process :skip_for_zip

  def skip_for_zip
    zip_types = %w[application/zip \
                   application/x-zip \
                   application/x-zip-compressed]
    !zip_types.include?(file_content_type)
  end

  @types = [/\Aimage/,
            /\Aaudio/,
            /\Avideo/,
            /\Atext/,
            'application/pdf',
            'application/zip',
            'application/x-zip',
            'application/x-zip-compressed']

  validates_attachment_content_type :file, content_type: @types
end
