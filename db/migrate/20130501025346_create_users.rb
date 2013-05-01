class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.date :created_at
      t.date :updated_at
      t.string :name

      t.timestamps
    end
  end
end
