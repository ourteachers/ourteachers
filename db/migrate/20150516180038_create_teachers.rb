class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.integer :number_of_reviews
      t.integer :school_id

      t.timestamps
    end
  end
end
