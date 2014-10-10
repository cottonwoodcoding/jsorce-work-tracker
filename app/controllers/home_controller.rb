class HomeController < ApplicationController

  def index
    if @current_work_period = current_user.current_work_period
      @work_period_jobs = @current_work_period.jobs
    end
    @passed_work_periods_count = current_user.passed_work_periods.count
  end
end
