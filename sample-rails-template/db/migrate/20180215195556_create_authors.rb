class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :string
      t.integer :age

      t.timestamps
    end
  end
end
