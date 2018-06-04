class Question < ApplicationRecord
  attr_accessor :tag_create


  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :tags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  after_create do
    question_tag_create
  end

  after_update do
    question_tag_update
  end

  def check_tag_presence
    if self.answer.present?
      self.answer.scan(/#[\p{L}0-9_]{1,55}/)
    else
      self.text.scan(/#[\p{L}0-9_]{1,55}/)
    end
  end

  def question_tag_create
    question = Question.find_by(id: self.id)
    check_tag_presence.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end

  def question_tag_update
    question = Question.find_by(id: self.id)
    question.tags.clear
    check_tag_presence.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end
end
