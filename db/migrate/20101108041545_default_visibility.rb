class DefaultVisibility < ActiveRecord::Migration
  def self.up
  	add_index :settings, :var, :unique => true
  	change_column_default :portfolios, :visible, 'f'
  end

  def self.down
  end
end
