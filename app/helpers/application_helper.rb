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
    "#{pluralize(values.first, 'hour')} - #{pluralize(values.last, 'minute')}"
  end
end
