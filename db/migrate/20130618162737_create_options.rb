class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :content
      t.references :survey

      t.timestamps
    end
  end
end
