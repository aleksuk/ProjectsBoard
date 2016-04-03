require 'rails_helper'

RSpec.describe Api::AttachmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      project_id = 1

      expect(:get => "/api/projects/#{project_id}/attachments.json").to route_to(controller: 'api/attachments',
                                                                                 action: 'index',
                                                                                 project_id: project_id.to_s,
                                                                                 format: 'json')
    end

    it "routes to #create" do
      expect(:post => '/api/attachments').to route_to('api/attachments#create')
    end

    it "routes to #update via PUT" do
      expect(:put => '/api/attachments/1').to route_to('api/attachments#update', :id => '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => '/api/attachments/1').to route_to('api/attachments#update', :id => '1')
    end

    it "routes to #destroy" do
      expect(:delete => '/api/attachments/1').to route_to('api/attachments#destroy', :id => '1')
    end
  end
end
