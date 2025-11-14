class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.integer :group
      t.integer :subgroup
      t.text :short_description

      t.timestamps
    end
  end
end
