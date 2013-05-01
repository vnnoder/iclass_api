class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :detail
      t.references :user
      t.references :session
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
    add_index :questions, :user_id
    add_index :questions, :session_id
  end
end
