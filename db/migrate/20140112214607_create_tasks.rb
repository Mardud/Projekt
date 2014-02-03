class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :done
      t.string :name
      t.references :day, index: true

      t.timestamps
    end
  end
end
