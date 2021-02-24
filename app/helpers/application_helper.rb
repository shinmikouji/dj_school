module ApplicationHelper
  BASE_TITLE = "EYM_DJ_SCHOOL".freeze
  def full_title(page_title)
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end
end