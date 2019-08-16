# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true, optional: true

      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end