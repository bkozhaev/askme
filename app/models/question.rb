class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_and_belongs_to_many :tags, dependent: :destroy

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  before_save :question_tag_create

  def create_tags_from_answer_and_text
      tag = text.scan(/#[\p{L}0-9_]{1,55}/)
      tag << self.answer.scan(/#[\p{L}0-9_]{1,55}/) if self.answer.present?
      tag
  end

  def question_tag_create
    self.tags.clear
    create_tags_from_answer_and_text.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.to_s.downcase.delete('[]#""'))
      self.tags << tag unless tag.nil?
    end
  end
end
