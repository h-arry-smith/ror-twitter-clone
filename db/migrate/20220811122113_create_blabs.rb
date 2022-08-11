class CreateBlabs < ActiveRecord::Migration[7.0]
  def change
    create_table :blabs do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
