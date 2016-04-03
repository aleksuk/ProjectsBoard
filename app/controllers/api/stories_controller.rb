class Api::StoriesController < ApplicationController

  before_action :set_story, only: [:show, :update, :destroy]

  def index
    @stories = Project.find(params[:project_id]).stories.all
  end

  def show
  end

  def create
    @story = Project.find(project_id).stories.new(story_params)

    if @story.save
      render :show
    else
      @errors = @story.errors
      render 'base/error', status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy!
    render json: {}
  end

  def update
    if @story.update(story_params)
      render :show
    else
      @errors = @story.errors
      render 'base/error', status: :unprocessable_entity
    end
  end

  private
    def project_id
      # params.fetch(:story, {}).fetch(:project, nil)
      params.dig(:story, :project)
    end

    def story_params
      params.require(:story).permit(:title, :hours)
    end

    def set_story
      @story = Story.find(params[:id])
    end
end
