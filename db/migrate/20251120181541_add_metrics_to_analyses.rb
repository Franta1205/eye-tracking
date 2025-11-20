class AddMetricsToAnalyses < ActiveRecord::Migration[7.1]
  def change
    add_column :analyses, :shannon_entropy, :decimal
    add_column :analyses, :visual_clarity, :decimal
    add_column :analyses, :clutter_index, :decimal
    add_column :analyses, :cognitive_load, :decimal
  end
end
