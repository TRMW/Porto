class DefaultVisibility < ActiveRecord::Migration
  def self.up
  	change_column_default :portfolios, :visible, 'f'
  	add_index :settings, :var, :unique => true
  end

  def self.down
  end
end
