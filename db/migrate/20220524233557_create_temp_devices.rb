class CreateTempDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :temp_devices do |t|

      t.timestamps
    end
  end
end
