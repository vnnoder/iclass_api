class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :type
      t.text :question
      t.references :talk

      t.timestamps
    end
  end
end
