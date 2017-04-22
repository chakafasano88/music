class CreateProfileTable < ActiveRecord::Migration[5.0]
  def change
    create_table :profile do |table|
      table.integer :user_id
      table.integer :post_id
      table.string :city
    end
  end
end
