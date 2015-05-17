class AddBioToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :bio, :string
  end
end
