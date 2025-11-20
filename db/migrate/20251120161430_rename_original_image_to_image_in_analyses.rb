class RenameOriginalImageToImageInAnalyses < ActiveRecord::Migration[7.1]
  def change
    rename_column :analyses, :original_image, :image
    remove_column :analyses, :heat_map, :string
  end
end
