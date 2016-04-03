require 'rails_helper'

RSpec.describe Api::StoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      project_id = 1

      expect(:get => "/api/projects/#{project_id}/stories.json").to route_to(controller: 'api/stories',
                                                                             action: 'index',
                                                                             project_id: project_id.to_s,
                                                                             format: 'json')
    end

    it "routes to #create" do
      expect(:post => '/api/stories').to route_to('api/stories#create')
    end

    it "routes to #update via PUT" do
      expect(:put => '/api/stories/1').to route_to('api/stories#update', :id => '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => '/api/stories/1').to route_to('api/stories#update', :id => '1')
    end

    it "routes to #destroy" do
      expect(:delete => '/api/stories/1').to route_to('api/stories#destroy', :id => '1')
    end
  end
end
