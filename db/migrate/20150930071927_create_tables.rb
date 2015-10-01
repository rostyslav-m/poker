class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :tabname
      t.datetime :time

      t.timestamps null: false
    end
  end
end
