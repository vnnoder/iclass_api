class CreateUserDeviceTokens < ActiveRecord::Migration
  def change
    create_table :user_device_tokens do |t|
      t.references :user
      t.string :device_token

      t.timestamps
    end
  end
end
