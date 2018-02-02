class Photo < ApplicationRecord
  belongs_to :meetup
  has_attached_file :file
  validates_attachment_content_type :file, content_type: /\Aimage/
  validates :meetup_id, :title, presence: true
end
