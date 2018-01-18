class CreateTimeWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :time_works do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :finish_date, null: false
      t.timestamps
    end
  end
end
