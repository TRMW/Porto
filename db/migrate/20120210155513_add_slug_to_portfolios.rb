class AddSlugToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :slug, :string
    add_index :portfolios, :slug, unique: true

  end
end
