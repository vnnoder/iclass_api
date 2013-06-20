class ChangeSurveyType < ActiveRecord::Migration
  def up
    remove_column :surveys, :type
    add_column :surveys, :type, :integer
  end

  def down
    remove_column :surveys, :type
    add_column :surveys, :type, :string
  end
end
