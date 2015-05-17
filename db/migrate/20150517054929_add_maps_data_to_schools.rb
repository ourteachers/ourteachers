class AddMapsDataToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :google_reference, :string
    add_column :schools, :place_id, :string
  end
end
