require 'rails_helper'

RSpec.describe Api::AttachmentsController, type: :controller do
  let(:valid_attributes) { attributes_for(:attachment) }
  let(:invalid_attributes) { attributes_for(:attachment, link: nil) }

  before do
    @project = create(:project)
  end

  after do
    @project.destroy!
    @project = nil
  end

  describe "GET #index" do
    before do
      @attachments = []
      5.times { @attachments << @project.attachments.create!(valid_attributes) }
    end

    after do
      @attachments = nil
      @project.attachments.destroy_all
    end

    it "assigns all attachments as @attachments" do
      get :index, format: :json, project_id: @project.to_param

      expect(response).to render_template(:index)
      expect(assigns(:attachments)).to eq(@attachments)
    end
  end

  describe "GET #show" do
    before do
      @attachment = @project.attachments.create!(valid_attributes)
    end

    after do
      @attachment.destroy!
    end

    it "assigns the requested attachment as @attachment" do
      get :show, format: :json, id: @attachment.to_param

      expect(response).to render_template(:show)
      expect(assigns(:attachment)).to eq(@attachment)
    end
  end
end
