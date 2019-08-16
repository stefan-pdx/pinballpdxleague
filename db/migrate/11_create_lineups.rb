# frozen_string_literal: true

class CreateLineups < ActiveRecord::Migration[5.2]
  def change
    create_table :lineups do |t|
      t.integer :playable_id
      t.string :playable_type

      t.integer :participant_id
      t.string :participant_type

      t.integer :order

      t.timestamps
    end

    add_index :lineups, %i[playable_id playable_type]
    add_index :lineups, %i[participant_id participant_type]
  end
end
