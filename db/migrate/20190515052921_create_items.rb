class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :start_time
      t.integer :price
      t.string :income_and_expenditure

      t.timestamps
    end
  end
end
