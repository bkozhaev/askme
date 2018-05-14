class CreateQuestionsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :questions_tags do |t|
      t.references :question, index: true, foreign_key: true
      t.references :tag,index: true, foreign_key: true
    end
  end
end
