class WorkWeekController < ApplicationController
  def start
    current_user.work_weeks << WorkWeek.create!(date_started: Time.now)
    flash[:notice] = "Your work week has started!"
    redirect_to controller: :home, action: :index
  end

  def end
    current_user.current_work_week.update_attributes!(active: false, date_ended: Time.now)
    flash[:notice] = "Your work week has ended!"
    redirect_to controller: :home, action: :index
  end

  def add_work
    @work_log = WorkLog.new
  end
end
