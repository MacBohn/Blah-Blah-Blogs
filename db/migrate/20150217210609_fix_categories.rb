class FixCategories < ActiveRecord::Migration
  def change
    remove_column :posts, :category
    add_column :posts, :category_id, :integer
  end
end
