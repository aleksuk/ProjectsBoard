class Api::AttachmentsController < ApplicationController

  before_action :set_attachment, only: [:show, :update, :destroy]

  def index
    @attachments = Project.find(params[:project_id]).attachments
  end

  def show
  end

  private
    def attachment_params
      params.require(:attachment)
        .permit(
          :name,
          :link
        )
    end

    def project_id
      params.dig(:attachment, :project)
    end

    def set_attachment
      @attachment = Attachment.find(params[:id])
    end
end
