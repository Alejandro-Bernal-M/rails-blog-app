# frozen_string_literal: true

class AddAuthorToLike < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :author_id
  end
end
