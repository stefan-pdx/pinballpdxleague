class CreateGameOutcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :game_outcomes do |t|
      t.references :game, foreign_key: true

      t.string :type

      t.timestamps
    end
  end
end
