# frozen_string_literal: true

class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.references :match, foreign_key: true

      t.string :type

      t.integer :round_number

      t.timestamps
    end

    add_index :rounds, %i[match_id round_number]
  end
end
