class Api::TasksController < ApplicationController

  before_action :find_task, only: [:update, :destroy, :show]

  def index
    @tasks = Story.find(params[:story_id]).tasks.all
  end

  def show
  end

  def create
    @task = Story.find(story_id).tasks.new(task_params)

    if @task.save
      render :show
    else
      @errors = @task.errors
      render 'base/error', status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render :show
    else
      @errors = @task.errors
      render 'base/error', status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      render json: {}
    else
      @errors = @task.errors
      render 'base/error', status: :unprocessable_entity
    end
  end

  private
    def task_params
      params.require(:task).permit(:body)
    end

    def story_id
      # params.fetch(:task, {}).fetch(:story, nil)
      params.dig(:task, :story)
    end

    def find_task
      @task = Task.find(params[:id])
    end
end
