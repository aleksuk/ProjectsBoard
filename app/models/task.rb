class Task < ActiveRecord::Base
  belongs_to :story

  validates :body, presence: true
end
