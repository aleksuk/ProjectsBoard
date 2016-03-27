json.project  do
  json.extract! @project,
                :id,
                :name,
                :created_at,
                :updated_at

  json.links do
    json.stories stories_url(project: @project)
  end

  json.url project_url(@project)
end