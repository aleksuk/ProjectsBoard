json.attachments(@attachments) do |attachment|
  json.extract! attachment,
                :id,
                :link,
                :name,
                :project_id,
                :created_at,
                :updated_at

  # json.links do
  #   json.tasks tasks_url(story: story)
  #   json.project project_url(story.project)
  # end

  json.url api_attachment_url(attachment)
end