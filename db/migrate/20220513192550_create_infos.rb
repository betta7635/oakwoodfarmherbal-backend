class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.string :primaryCommonName
      t.string :photoImagePath
      t.string :formattedScientificName
      t.string :color
      t.string :duration
      t.string :source
      t.text :description
      t.text :uses
      t.text :conservationInfo
      t.text :notes
      t.integer :amount
      t.references :plant, null: true, foreign_key: true
      t.references :seed_share, null: true, foreign_key: true

      t.timestamps
    end
  end
end
