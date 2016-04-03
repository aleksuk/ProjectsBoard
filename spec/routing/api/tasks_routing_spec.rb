require 'rails_helper'

RSpec.describe Api::TasksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      story_id = 1

      expect(:get => "/api/stories/#{story_id}/tasks.json").to route_to(controller: 'api/tasks',
                                                                        action: 'index',
                                                                        story_id: story_id.to_s,
                                                                        format: 'json')
    end

    it "routes to #create" do
      expect(:post => '/api/tasks').to route_to('api/tasks#create')
    end

    it "routes to #update via PUT" do
      expect(:put => '/api/tasks/1').to route_to('api/tasks#update', :id => '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => '/api/tasks/1').to route_to('api/tasks#update', :id => '1')
    end

    it "routes to #destroy" do
      expect(:delete => '/api/tasks/1').to route_to('api/tasks#destroy', :id => '1')
    end
  end
end
