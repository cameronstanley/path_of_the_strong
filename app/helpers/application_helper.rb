module ApplicationHelper

  def flash_class(level)
    case level.to_sym
      when :success then 'alert-success'
      when :notice then 'alert-info'
      when :warning then 'alert-warning'
      when :error then 'alert-danger'
    end
  end

end
