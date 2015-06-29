class AddGradesToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :min_grade, :integer
    add_column :teachers, :max_grade, :integer
  end
end
