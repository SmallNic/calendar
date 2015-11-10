class CreateUsersCalendars < ActiveRecord::Migration
  def change
    create_table :users_calendars do |t|
      t.references :user, index: true, foreign_key: true
      t.references :calendar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
