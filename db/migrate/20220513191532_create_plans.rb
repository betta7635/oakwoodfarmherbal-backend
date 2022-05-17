class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :photoImagePath
      t.string :planName
      t.string :planLocation
      t.text :planDescription
      t.text :planNotes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
