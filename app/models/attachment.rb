class Attachment < ActiveRecord::Base
  belongs_to :project

  validates :link, presence: true
end
