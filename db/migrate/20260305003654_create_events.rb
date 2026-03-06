class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :day
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
