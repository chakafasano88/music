class CreateProfilesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |table|
      table.integer :user_id
      table.integer :post_id
      table.string :city
    end
  end
end
