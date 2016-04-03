json.project  do
  json.extract! @project,
                :id,
                :name,
                :description,
                :attachments,
                :created_at,
                :updated_at

  json.links do
    json.stories api_project_stories_url(@project)
  end

  json.url api_project_url(@project)
end