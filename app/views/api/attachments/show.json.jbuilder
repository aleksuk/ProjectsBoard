json.attachment  do
  json.extract! @attachment,
                :id,
                :link,
                :name,
                :project_id,
                :created_at,
                :updated_at

  # json.links do
  #   json.tasks api_tasks_url(attachment: @attachment)
  #   json.project api_project_url(@attachment.project)
  # end

  json.url api_attachment_url(@attachment)
end
