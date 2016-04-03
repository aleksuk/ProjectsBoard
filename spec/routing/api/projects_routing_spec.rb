require 'rails_helper'

RSpec.describe Api::ProjectsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => '/api/projects.json').to route_to(controller: 'api/projects', action: 'index', format: 'json')
    end

    it "routes to #create" do
      expect(:post => '/api/projects').to route_to('api/projects#create')
    end

    it "routes to #update via PUT" do
      expect(:put => '/api/projects/1').to route_to('api/projects#update', :id => '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => '/api/projects/1').to route_to('api/projects#update', :id => '1')
    end

    it "routes to #destroy" do
      expect(:delete => '/api/projects/1').to route_to('api/projects#destroy', :id => '1')
    end
  end
end
