class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
