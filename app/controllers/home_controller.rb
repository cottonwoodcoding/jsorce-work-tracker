class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_work_week = current_user.current_work_week
    @passed_work_weeks = current_user.passed_work_weeks || []
  end
end
