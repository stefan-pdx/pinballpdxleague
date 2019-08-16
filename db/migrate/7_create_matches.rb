# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :tournament, foreign_key: true
      t.references :venue, foreign_key: true

      t.string :type

      t.integer :match_number

      t.datetime :start_time

      t.timestamps
    end
  end
end
