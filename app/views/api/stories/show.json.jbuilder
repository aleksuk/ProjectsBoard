json.story  do
  json.extract! @story,
                :id,
                :title,
                :project_id,
                :created_at,
                :updated_at

  json.links do
    json.tasks api_story_tasks_url(@story)
    json.project api_project_url(@story.project)
  end

  json.url api_story_url(@story)
end
