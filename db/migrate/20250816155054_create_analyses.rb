class CreateAnalyses < ActiveRecord::Migration[7.1]
  def change
    create_table :analyses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :participants, null: false
      t.integer :analysis_type, null: false
      t.string :original_image
      t.text :goals
      t.string :heat_map
      t.text :ai_feedback
      t.timestamps
    end
  end
end
