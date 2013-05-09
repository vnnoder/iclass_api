class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user
      t.references :talk
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
