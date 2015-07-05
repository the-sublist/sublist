class FixAgeOnTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :age
    add_column :teachers, :birthday, :date
  end
end
