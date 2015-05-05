module ApplicationHelper
  def fix_url(date)
    date.strftime(" created at %m/%d/%Y at %l:%M%P %Z")
  end
end
