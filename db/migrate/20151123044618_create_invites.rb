class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :recipient
      t.references :calendar, index: true, foreign_key: true
      t.string :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
