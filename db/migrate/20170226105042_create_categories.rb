class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.string :display_name

      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
