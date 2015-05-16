class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :child_happiness
      t.integer :child_learning
      t.integer :communication
      t.text :comments

      t.timestamps
    end
  end
end
