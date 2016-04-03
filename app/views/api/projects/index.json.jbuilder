json.projects(@projects) do |project|
  json.extract! project, :id,
                         :name,
                         :description,
                         :updated_at
  # json.links do
  #   json.stories stories_url(project: project)
  # end

  json.url api_project_url(project)

end

json.meta do
  json.pages pagination_dict(@projects)
end
