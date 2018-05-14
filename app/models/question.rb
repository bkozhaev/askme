class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :tags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  after_create do
    question = Question.find_by(id: self.id)
    hashtags = self.text.scan(/#\w+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end

  after_update do
    question = Question.find_by(id: self.id)
    question.tags.clear
    hashtags = self.text.scan(/#\w+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end
end
