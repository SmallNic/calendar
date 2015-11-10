class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :description
      t.references :calendar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
