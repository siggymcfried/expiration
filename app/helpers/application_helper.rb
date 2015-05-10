module ApplicationHelper
  def icon_for(icon_name)
    Icon.new(icon_name: icon_name).render
  end

  def badge_for(count:)
    content_tag(:span, count, class: 'badge')
  end
end
