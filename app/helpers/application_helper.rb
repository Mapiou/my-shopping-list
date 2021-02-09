module ApplicationHelper
  def active_link_to(text, path)
    content_tag(:li, class: "nav-item") do
      link_to text,
              path,
              class: "nav-link #{'active text-danger' if current_page?(path)}"
    end
  end
end
