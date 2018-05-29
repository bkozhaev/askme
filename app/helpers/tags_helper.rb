module TagsHelper
  def render_with_hashtags(text)
     link_to text, "/tags/hashtags/#{text.downcase}".html_safe
  end
end
