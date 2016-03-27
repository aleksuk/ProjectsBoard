json.projects(@projects) do |project|
  json.extract! project, :id,
                         :name,
                         :updated_at
  # json.links do
  #   json.stories stories_url(project: project)
  # end

  json.url project_url(project)
end