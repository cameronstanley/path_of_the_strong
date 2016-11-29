module FormHelper
  def form_group_error_class(model, attribute)
    field_has_error?(model, attribute) ? 'has-error' : nil
  end

  def help_block_error_message(model, attribute, model_name=nil)
    if field_has_error?(model, attribute)
      display_name = model_name.present? ? model_name : model.class.human_attribute_name(attribute)
      errors = model.errors[attribute].join(', ')
      content_tag(:span, "#{display_name} #{errors}", class: 'help-block')
    else
      ''
    end
  end

  def field_has_error?(model, attribute)
    model.errors[attribute].present?
  end
end
