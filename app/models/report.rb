class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true
end
