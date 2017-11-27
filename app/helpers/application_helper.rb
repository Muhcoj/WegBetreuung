module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction 
  end

  def admin_types
    ['AdminUser']
  end


  def active?(path)
    "active" if current_page?(path)
  end
end
