json.task  do
  json.extract! @task,
                :id,
                :body,
                :story_id,
                :created_at,
                :updated_at

  json.links do
    json.story story_path(@task.story)
  end

  json.url story_path(@task)
end