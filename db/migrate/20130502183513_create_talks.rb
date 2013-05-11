class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.references :user
    
      t.timestamps
    end
    add_index :talks, :user_id
  end
end
