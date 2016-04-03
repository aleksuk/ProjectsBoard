require 'rails_helper'

RSpec.describe Api::StoriesController, type: :controller do
  let(:valid_attributes) { attributes_for(:story) }
  let(:invalid_attributes) { attributes_for(:story, title: nil) }

  before do
    @project = create(:project)
  end

  after do
    @project.destroy!
    @project = nil
  end

  describe "GET #index" do
    before do
      @stories = []
      5.times { @stories << @project.stories.create!(valid_attributes) }
    end

    after do
      @project.stories.destroy_all
    end

    it "assigns all stories as @stories" do
      get :index, format: :json, project_id: @project.to_param

      expect(response).to render_template(:index)
      expect(assigns(:stories)).to eq(@stories)
    end
  end

  describe "GET #show" do
    before do
      @story = @project.stories.create!(valid_attributes)
    end

    after do
      @story.destroy!
    end

    it "assigns the requested story as @story" do
      get :show, format: :json, id: @story.to_param

      expect(response).to render_template(:show)
      expect(assigns(:story)).to eq(@story)
    end
  end

  describe "POST #create" do
    after do
      @project.stories.destroy_all
    end

    context "with valid params" do
      it "creates a new story" do
        expect {
          post :create, format: :json, story: valid_attributes.merge(project: @project.to_param)
        }.to change(Story, :count).by(1)
      end

      it "assigns a newly created story as @story" do
        post :create, format: :json, story: valid_attributes.merge(project: @project.to_param)

        expect(assigns(:story)).to be_a(Story)
        expect(assigns(:story)).to be_persisted
      end

      it "creates a project with valid attributes" do
        post :create, format: :json, story: valid_attributes.merge(project: @project.to_param)

        expect(assigns(:story)).to have_attributes(valid_attributes)
      end
    end

    context "with invalid attributes" do
      it "assigns the errors as @errors with invalid attributes" do
        post :create, format: :json, id: @story.to_param, story: invalid_attributes.merge(project: @project.to_param)

        expect(assigns(:errors).include?(:title)).to be_truthy
      end
    end
  end

  describe "PUT #update" do
    before do
      @story = @project.stories.create!(valid_attributes)
    end

    after do
      @story = nil
      @project.stories.destroy_all
    end

    context "with valid params" do
      let(:new_attributes) { attributes_for(:story, title: 'New title') }

      it "updates the requested story" do
        put :update, format: :json, id: @story.to_param, story: new_attributes

        @story.reload

        expect(@story).to have_attributes(new_attributes)
      end

      it "assigns the requested story as @story" do
        put :update, format: :json, id: @story.to_param, story: new_attributes

        expect(assigns(:story)).to eq(@story)
      end
    end

    context "with invalid params" do
      it "assigns the errors as @errors with invalid attributes" do
        put :update, format: :json, id: @story.to_param, story: invalid_attributes

        expect(assigns(:errors).include?(:title)).to be_truthy
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @story = @project.stories.create!(valid_attributes)
    end

    after do
      @story = nil
      @project.stories.destroy_all
    end

    it "destroys the requested project" do
      expect {
        delete :destroy, format: :json, id: @story.to_param
      }.to change(Story, :count).by(-1)
    end
  end
end
