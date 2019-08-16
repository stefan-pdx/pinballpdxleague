# frozen_string_literal: true

class CreateConfirmations < ActiveRecord::Migration[5.2]
  def change
    create_table :confirmations do |t|
      t.references :confirmed_by, foreign_key: { to_table: :users }

      t.integer :confirmable_id
      t.string :confirmable_type

      t.integer :confirmer_id
      t.string :confirmer_type

      t.timestamps
    end

    add_index :confirmations, :confirmed_by
  end
end
