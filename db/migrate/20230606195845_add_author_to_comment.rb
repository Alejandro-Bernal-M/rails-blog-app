# frozen_string_literal: true

class AddAuthorToComment < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :author_id
  end
end
