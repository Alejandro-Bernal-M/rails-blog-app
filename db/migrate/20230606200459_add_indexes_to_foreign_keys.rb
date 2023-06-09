# frozen_string_literal: true

class AddIndexesToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_index :comments, :author_id
    add_index :comments, :post_id
    add_index :likes, :author_id
    add_index :likes, :post_id
    add_index :posts, :author_id
  end
end
