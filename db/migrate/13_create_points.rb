# frozen_string_literal: true

class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :game_outcomes do |t|
      t.references :game, foreign_key: true

      t.integer :awardee_id
      t.string :awardee_type

      t.integer :value

      t.timestamps
    end
  end
end
