class CreateCourseMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :course_memberships do |t|
      t.integer :user_id, null: false
      t.integer :course_id, null: false

      t.timestamps
    end
    add_index :course_memberships, [:user_id, :course_id], unique: true
  end
end
