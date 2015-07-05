class UpdateCredentialsOnTeachers < ActiveRecord::Migration
  def change
    rename_column :teachers, :credentials, :degree
    add_column :teachers, :area_of_study, :string
  end
end
