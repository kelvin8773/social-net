# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string :likeable_type
      t.bigint :likeable_id
      t.integer :user_id

      t.timestamps
    end

    add_index :likes, %i[likeable_type likeable_id]
  end
end
