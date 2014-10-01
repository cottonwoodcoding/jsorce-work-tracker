require 'rails_helper'

RSpec.describe WorkWeekController, :type => :controller do

  describe "GET start" do
    it "returns http success" do
      get :start
      expect(response).to be_success
    end
  end

end
