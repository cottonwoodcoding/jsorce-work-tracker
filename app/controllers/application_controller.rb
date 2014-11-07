class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :jobs

  def jobs
    @jobs ||= Job.all.to_a.uniq{|job| job.name}
  end

end
