json.task  do
  json.extract! @task,
                :id,
                :body,
                :story_id,
                :created_at,
                :updated_at

  json.links do
    json.story api_story_path(@task.story)
  end

  json.url api_story_path(@task)
end