module QuestionsHelper
  def render_with_hashtags(text)
    text.gsub(/#\w+/){|word| link_to word, "/questions/hashtags/#{word.delete('#')}"}.html_safe
  end
end
