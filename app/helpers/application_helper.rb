module ApplicationHelper
  # Format active link in navbar
  def active_link_to(text, path)
    content_tag(:li, class: "nav-item") do
      link_to text,
              path,
              class: "nav-link #{'active text-danger' if current_page?(path)}"
    end
  end

  # Format specific unit 'piece'
  def format_unit(quantity, unit)
    if unit == 'pièce'
      t('plurals.items', count: quantity)
    else
      unit
    end
  end
end
