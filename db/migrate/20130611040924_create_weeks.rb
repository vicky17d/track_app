class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :name
      t.string :startDate
      t.string :endDate
      t.string :status

      t.timestamps
    end
  end
end
