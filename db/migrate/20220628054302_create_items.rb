class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,            null: false
      t.text :message,              null: false
      t.integer :category_id,       null: false, numericality: { other_than: 1, message: "can't be blank" }
      t.integer :status_id,         null: false, numericality: { other_than: 1, message: "can't be blank" }
      t.integer :defrayment_id,     null: false, numericality: { other_than: 1, message: "can't be blank" }
      t.integer :region_id,         null: false, numericality: { other_than: 1, message: "can't be blank" }
      t.integer :reach_id,          null: false, numericality: { other_than: 1, message: "can't be blank" }
      t.integer :price,             null: false
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
