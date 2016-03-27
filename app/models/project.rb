class Project < ActiveRecord::Base
  has_many :stories, dependent: :destroy
end
