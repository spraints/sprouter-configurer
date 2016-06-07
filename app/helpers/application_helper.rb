module ApplicationHelper
  def duration_button(duration, label = duration)
    content_tag(:label, :class => "btn btn-primary") do
      radio_button_tag(:duration, duration, false, :class => "js-until") + label
    end
  end
end
