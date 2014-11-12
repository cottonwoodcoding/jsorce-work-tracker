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
    values = (minutes.to_f / 60.0).round(2).to_s.split('.')
    hours = values.first
    minutes = ((values.last.to_f * 60) / 100).round
    minutes = 30 if minutes == 3.0
    "#{pluralize(hours, 'hour')} - #{pluralize(minutes, 'minute')}"
  end
end
