class AddFieldsToSchool < ActiveRecord::Migration
  def change
  	add_column :schools, :name, :string
  	add_column :schools, :city, :string
  	add_column :schools, :state, :string
  end
end
