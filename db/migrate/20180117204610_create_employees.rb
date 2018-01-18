class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :last_name, null: false
      t.string :identification, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
