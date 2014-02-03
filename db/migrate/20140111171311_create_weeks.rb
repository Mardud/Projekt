class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
