class Api::ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :update, :destroy]

  PROJECTS_PER_PAGE = 20

  def index
    @projects = Project.page(get_page).per(PROJECTS_PER_PAGE)
  end

  def show
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render :show
    else
      @errors = @project.errors
      render 'base/error', status: :unprocessable_entity
    end
  end

  def update
    Project.transaction do
      @project.clear_old_attachments(get_attachments_ids)

      if @project.update(project_params)
        render :show
      else
        @errors = @project.errors
        render 'base/error', status: :unprocessable_entity
        raise ActiveRecord::Rollback, 'Invalid model parameters'
      end
    end
  end

  def destroy
    @project.destroy!

    render json: {}
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project)
        .permit(
          :name,
          :description,
          attachments_attributes: [:link, :name, :id]
        ).tap do |whitelist|
          whitelist[:attachments_attributes] = attachments_params
        end
    end

    def attachments_params
      params.require(:project)
        .permit(attachments: [:id, :link, :name])
        .fetch(:attachments, [])
    end

    def get_page
      params[:page] || 1
    end

    def get_attachments_ids
      attachments_params.reduce [] do |memo, obj|
        id = obj[:id]

        memo << id if id
        memo
      end
    end
end
