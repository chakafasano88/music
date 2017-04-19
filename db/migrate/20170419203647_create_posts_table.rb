class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |table|
      table.string :title
      table.datetime :date
      table.integer :user_id
    end
  end
end
