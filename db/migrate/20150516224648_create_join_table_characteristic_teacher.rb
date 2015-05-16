class CreateJoinTableCharacteristicTeacher < ActiveRecord::Migration
  def change
	create_join_table :qualities, :teachers do |t|
       t.index [:quality_id, :teacher_id]
       t.index [:teacher_id, :quality_id]
    end
  end
end
