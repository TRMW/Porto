class AddDescriptionToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :description, :text

  end
end
