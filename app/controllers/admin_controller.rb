class AdminController < ApplicationController
  before_filter :users

  def work_logs
  end

  def setup_appointments
  end

  private

  def users
    @users = User.all
  end
end
