class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.integer    :category_id,       null: false
      t.string     :text
      t.integer    :quantity
      t.timestamps
    end
  end
end