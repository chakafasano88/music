class DeleteColumnAdd < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :post_id
  end
end
