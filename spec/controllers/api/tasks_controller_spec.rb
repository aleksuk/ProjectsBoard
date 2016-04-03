require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do
  let(:valid_attributes) { attributes_for(:task) }
  let(:invalid_attributes) { attributes_for(:task, body: nil) }

  before do
    @story = create(:story)
  end

  after do
    @story.destroy!
    @story = nil
  end

  describe "GET #index" do
    before do
      @tasks = []
      5.times { @tasks << @story.tasks.create!(valid_attributes) }
    end

    after do
      @story.tasks.destroy_all
    end

    it "assigns all tasks as @tasks" do
      get :index, format: :json, story_id: @story.to_param

      expect(response).to render_template(:index)
      expect(assigns(:tasks)).to eq(@tasks)
    end
  end

  describe "GET #show" do
    before do
      @task = @story.tasks.create!(valid_attributes)
    end

    after do
      @task.destroy!
    end

    it "assigns the requested task as @task" do
      get :show, format: :json, id: @task.to_param

      expect(response).to render_template(:show)
      expect(assigns(:task)).to eq(@task)
    end
  end

  describe "POST #create" do
    after do
      @story.tasks.destroy_all
    end

    context "with valid params" do
      it "creates a new task" do
        expect {
          post :create, format: :json, task: valid_attributes.merge(story: @story.to_param)
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, format: :json, task: valid_attributes.merge(story: @story.to_param)

        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end

      it "creates a story with valid attributes" do
        post :create, format: :json, task: valid_attributes.merge(story: @story.to_param)

        expect(assigns(:task)).to have_attributes(valid_attributes)
      end
    end

    context "with invalid attributes" do
      it "assigns the errors as @errors with invalid attributes" do
        post :create, format: :json, id: @task.to_param, task: invalid_attributes.merge(story: @story.to_param)

        expect(assigns(:errors).include?(:body)).to be_truthy
      end
    end
  end

  describe "PUT #update" do
    before do
      @task = @story.tasks.create!(valid_attributes)
    end

    after do
      @task = nil
      @story.tasks.destroy_all
    end

    context "with valid params" do
      let(:new_attributes) { attributes_for(:task, body: 'New title') }

      it "updates the requested task" do
        put :update, format: :json, id: @task.to_param, task: new_attributes

        @task.reload

        expect(@task).to have_attributes(new_attributes)
      end

      it "assigns the requested task as @task" do
        put :update, format: :json, id: @task.to_param, task: new_attributes

        expect(assigns(:task)).to eq(@task)
      end
    end

    context "with invalid params" do
      it "assigns the errors as @errors with invalid attributes" do
        put :update, format: :json, id: @task.to_param, task: invalid_attributes

        expect(assigns(:errors).include?(:body)).to be_truthy
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @task = @story.tasks.create!(valid_attributes)
    end

    after do
      @task = nil
      @story.tasks.destroy_all
    end

    it "destroys the requested story" do
      expect {
        delete :destroy, format: :json, id: @task.to_param
      }.to change(Task, :count).by(-1)
    end
  end
end
