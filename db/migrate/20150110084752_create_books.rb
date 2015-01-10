class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :subject
      t.string :title
      t.string :file
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
