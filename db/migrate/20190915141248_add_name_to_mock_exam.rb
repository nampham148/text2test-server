class AddNameToMockExam < ActiveRecord::Migration[5.2]
  def change
    add_column :mock_exams, :name, :string
  end
end
