class AddApplicationsToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :applications, foreign_key: true
  end
end
