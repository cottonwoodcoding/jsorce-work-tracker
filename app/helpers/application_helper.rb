module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then
        'info'
      when :error then
        'error'
      when :alert then
        'warning'
    end
  end

  def admin?
    current_user.role == 'admin'
  end

  def minutes_in_words(minutes)
    Time.at(minutes * 60).utc.strftime("%H Hours - %M Minutes").to_s
  end
end
