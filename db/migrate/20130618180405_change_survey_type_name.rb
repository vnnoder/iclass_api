class ChangeSurveyTypeName < ActiveRecord::Migration
  def up
    remove_column :surveys, :type
    add_column :surveys, :survey_type, :integer
  end

  def down
    remove_column :surveys, :survey_type
    add_column :surveys, :type, :integer
  end
end
