require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /api/projects" do
    before do
      25.times { Project.create!(attributes_for(:project)) }
    end

    after do
      Project.destroy_all
    end

    it "should return success status" do
      get api_projects_path

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
