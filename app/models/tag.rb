class Tag < ApplicationRecord

  has_and_belongs_to_many :questions

  def question_tag_create
    question = Question.find_by(id: self.id)
    if self.answer.present?
      hashtags = self.answer.scan(/#[\p{L}0-9_]{1,55}/)
    else
      hashtags = self.text.scan(/#[\p{L}0-9_]{1,55}/)
    end
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end

  def question_tag_update
    question = Question.find_by(id: self.id)
    question.tags.clear
    if self.answer.present?
      hashtags = self.answer.scan(/#[\p{L}0-9_]{1,55}/)
    else
      hashtags = self.text.scan(/#[\p{L}0-9_]{1,55}/)
    end

    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end
end
