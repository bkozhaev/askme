class Tag < ApplicationRecord

  has_and_belongs_to_many :questions


  def check_presence
    if self.answer.present?
      self.answer.scan(/#[\p{L}0-9_]{1,55}/)
    else
      self.text.scan(/#[\p{L}0-9_]{1,55}/)
    end
  end
end
