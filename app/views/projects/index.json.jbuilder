json.projects(@projects) do |project|
  json.extract! project, :id,
                         :name,
                         :updated_at

  json.url project_url(project, format: :json)
end