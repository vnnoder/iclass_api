class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :talks, :location, :string
  end
end
