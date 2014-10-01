require 'rails_helper'

RSpec.describe WorkLogsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET admin_work_logs" do
    it "returns http success" do
      get :admin_work_logs
      expect(response).to be_success
    end
  end

end
