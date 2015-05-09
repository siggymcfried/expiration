module ApplicationHelper
  def icon_for(icon_name)
    Icon.new(icon_name: icon_name).render
  end
end
