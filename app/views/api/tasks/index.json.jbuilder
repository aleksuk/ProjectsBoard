json.tasks(@tasks) do |task|
  json.extract! task,
                :id,
                :body,
                :story_id,
                :created_at,
                :updated_at

  # json.links do
  #   json.story story_path(task.story)
  # end

  json.url api_task_path(task)
end