class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :detail
      t.references :user
      t.references :talk
      t.timestamps
    end
    add_index :questions, :user_id
    add_index :questions, :talk_id
  end
end
