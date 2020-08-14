class CreateKarts < ActiveRecord::Migration[6.0]
  def change
    create_table :karts do |t|
      t.string :driver
      t.string :color
      t.string :body
      t.string :wheels
      t.belongs_to :garage, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
