class AddDefaultToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :likes
    add_column :posts, :likes, :integer
  end
end
