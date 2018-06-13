class Tag < ApplicationRecord

  has_and_belongs_to_many :questions
  scope :tag_has_answer, -> {where(name: Question.questions)}

end
