class HomeController < ApplicationController
  before_filter :jobs

  def index
    if @current_work_period = current_user.current_work_period
      @work_period_jobs = @current_work_period.jobs
    end
    @passed_work_periods_count = current_user.passed_work_periods.count
  end

  private

  def jobs
    @jobs ||= Job.all.to_a.uniq{|job| job.name}
  end

end
