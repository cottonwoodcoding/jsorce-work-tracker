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
    distance_of_time_in_words(Time.at(0), Time.at(minutes * 60), {include_seconds: true})
  end
end
