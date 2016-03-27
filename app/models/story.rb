class Story < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  belongs_to :project

  validates :title, presence: true
end
