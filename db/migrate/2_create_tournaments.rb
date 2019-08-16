class CreateTournaments < ActiveRecord::Migration[5.2]
    def change
        create_table :tournaments do |t|
            t.string :slug

            t.string :type

            t.string :name

            t.date :start_date
            t.date :end_date

            t.timestamps
        end

        add_index :tournaments, :slug, unique: true
    end
end
