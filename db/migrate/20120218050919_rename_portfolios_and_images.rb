class RenamePortfoliosAndImages < ActiveRecord::Migration
  def change
    rename_table :portfolios, :projects
    rename_column :photos, :portfolio_id, :project_id
    rename_column :photos, :image_file_name, :file_file_name
    rename_table :photos, :images
  end
end
