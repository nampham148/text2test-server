class CreateFlashcards < ActiveRecord::Migration[5.2]
  def change
    create_table :flashcards do |t|
      t.string :keyword, null: false
      t.text :value, null: false

      t.integer :course_id

      t.timestamps
    end
  end
end
