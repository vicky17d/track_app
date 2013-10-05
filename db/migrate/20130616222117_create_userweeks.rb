class CreateUserweeks < ActiveRecord::Migration
  def change
    create_table :userweeks do |t|
      t.string :summary
      t.string :jiras
      t.integer :user_id
      t.integer :week_id

      t.timestamps
    end
  end
end
