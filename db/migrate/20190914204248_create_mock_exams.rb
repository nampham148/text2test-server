class CreateMockExams < ActiveRecord::Migration[5.2]
  def change
    create_table :mock_exams do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :score
      t.integer :num_questions
      t.timestamps
    end
  end
end
