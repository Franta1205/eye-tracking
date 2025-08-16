class CreateAnalyses < ActiveRecord::Migration[7.1]
  def change
    create_table :analyses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :participants
      t.integer :analysis_type
      t.string :image
      t.text :goals
      t.timestamps
    end
  end
end
