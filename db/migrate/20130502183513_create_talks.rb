class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user
    
      t.timestamps
    end
    add_index :talks, :user_id
  end
end
