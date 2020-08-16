module ApplicationHelper
  def flash_message(message, type)
    content_tag(:div, class: "alert alert-#{type}") do
      concat content_tag(:button, '×', class: 'close', data: {dismiss: 'alert'})
      concat raw(message)
    end
  end
end