module ApplicationHelper
  def full_title(title)
    if title.empty?
      title = " | Inktellectual"
    else
      " | " << title
    end
  end
end
