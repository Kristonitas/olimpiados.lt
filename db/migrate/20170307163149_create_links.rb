class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.boolean :visible, null: false, default: true

      t.timestamps
    end
  end
end
