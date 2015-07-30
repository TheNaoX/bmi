class CreateBodyMassIndices < ActiveRecord::Migration
  def change
    create_table :body_mass_indices do |t|
      t.float   :height
      t.integer :weight
      t.float   :index
      t.string  :category
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
