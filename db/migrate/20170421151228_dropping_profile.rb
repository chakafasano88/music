class DroppingProfile < ActiveRecord::Migration[5.0]
  def change
    drop_table :profile
  end
end
