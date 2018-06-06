class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :tags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  after_create do
    question_tag_create
  end

  def create_tags_from_answer_and_text
    if self.answer.present?
      self.answer.scan(/#[\p{L}0-9_]{1,55}/)
    else
      self.text.scan(/#[\p{L}0-9_]{1,55}/)
    end
  end

  def question_tag_create
    self.tags.clear
    create_tags_from_answer_and_text.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag
    end
  end
end
