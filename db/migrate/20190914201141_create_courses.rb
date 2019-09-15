class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_id, null: false, default: ""
      t.string :topic
      t.timestamps
    end
  end
end
