json.story  do
  json.extract! @story,
                :id,
                :title,
                :project_id,
                :created_at,
                :updated_at

  json.links do
    json.tasks tasks_url(story: @story)
    json.project project_url(@story.project)
  end

  json.url story_url(@story)
end
