class CreateJoinTableCharacteristicTeacher < ActiveRecord::Migration
  def change
	create_join_table :qualities, :reviews do |t|
       t.index [:quality_id, :review_id]
       t.index [:review_id, :quality_id]
    end
  end
end
