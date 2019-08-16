# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :round, foreign_key: true
      t.references :machine, foreign_key: true

      t.string :type

      t.timestamps
    end
  end
end
