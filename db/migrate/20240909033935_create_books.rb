class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer        :category_id,       null: false
      t.text           :text
      t.integer        :price,             null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
