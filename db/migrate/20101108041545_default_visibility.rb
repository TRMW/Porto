class DefaultVisibility < ActiveRecord::Migration
  def self.up
  	change_column_default :portfolios, :visible, 'f'
  end

  def self.down
  end
end
