json.stories(@stories) do |story|
  json.extract! story,
                :id,
                :title,
                :project_id,
                :created_at,
                :updated_at

  # json.links do
  #   json.tasks tasks_url(story: story)
  #   json.project project_url(story.project)
  # end

  json.url api_story_url(story)
end