class CreateMcqQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :mcq_questions do |t|
      t.string :question, null: false
      t.string :option_a, null: false
      t.string :option_b, null: false
      t.string :option_c
      t.string :option_d

      t.integer :course_id, null: false

      t.timestamps
    end

    add_index :mcq_questions, :course_id
  end
end
