class CreateSettingsTable < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :var, :null => false
      t.text   :value, :null => true
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
