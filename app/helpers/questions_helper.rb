module QuestionsHelper
  def render_with_question(text)
    text.gsub(/#[\p{L}0-9_]{1,55}/){|word| link_to word, "/tags/hashtags/#{word.delete('#')}"}.html_safe
  end
end
