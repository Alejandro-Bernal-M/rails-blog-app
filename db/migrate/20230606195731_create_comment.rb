# frozen_string_literal: true

class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :post_id
      t.text :Text

      t.timestamps
    end
  end
end
