# frozen_string_literal: true

class AddAuthorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :author_id, :integer
    add_foreign_key :posts, :users, column: :author_id
  end
end
