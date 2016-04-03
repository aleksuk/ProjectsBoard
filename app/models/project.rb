class Project < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :attachments, dependent: :destroy, autosave: true

  accepts_nested_attributes_for :attachments

  def clear_old_attachments(ids)
    attachments.where.not(id: ids).destroy_all
  end
end
