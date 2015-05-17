class AddBioToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :bio, :text
  end
end
