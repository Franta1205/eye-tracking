class AddCountryToAnalyses < ActiveRecord::Migration[7.1]
  def change
    add_column :analyses, :country, :string
  end
end
