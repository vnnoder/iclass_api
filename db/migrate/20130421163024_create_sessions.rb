class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.references :user

      t.timestamps
    end

    add_index :sessions, :user_id
  end
end
