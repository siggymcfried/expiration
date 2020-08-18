# frozen_string_literal: true

class Icon
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def initialize(icon_name:)
    @icon_name = icon_name
  end

  def render
    content_tag(:i, nil, class: icon_class)
  end

  private
  attr_reader :icon_name

  def icon_class
    "fa #{icon_classes.fetch(icon_name)}"
  end

  def icon_classes
    {
      add:   'fa-plus',
      eaten: 'fa-cutlery',
      edit:  'fa-edit',
      trash: 'fa-trash-o'
    }
  end
end
