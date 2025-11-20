class ChangeImageToNotNullInAnalyses < ActiveRecord::Migration[7.1]
  def change
    # First, update any existing null values with a placeholder
    execute "UPDATE analyses SET image = 'placeholder.jpg' WHERE image IS NULL"

    # Then make the column not null
    change_column_null :analyses, :image, false
  end
end
